## rule set for R output: this way it is easy to manage it
## - use column names from the species table as `label'
## - compose file names as label.png (use png format exclusively,
##   but this can be changed if there is a good reason)
## - store all output files of same type (e.g. veg, hf, map, etc)
##   of all species in same directory. For example use the
##   ./hf/ directory for collecting HF response graphs
## - nest graph type within taxa: ./mites/hf/GenusSpecies.png,
## - the path should look like:
##   ./[taxon]/[graph_type]/[species_label].[extension]


#setwd("c:/Dropbox/www/species.abmi.ca/rscripts/")
#setwd("c:/Dropbox/www/species.abmi.ca/")
setwd("c:/p/AB_data_v2014/web/")

#TAXON <- c("mites", "mosses", "lichens","mammals", "birds", "vplants")
TAXON <- c("mites", "mosses", "lichens","mammals")
for (dir_in in TAXON) {
#dir_in <- "mites" # this is the root dir for a taxon
## can take values:
## - mites, birds, mammals, mosses, vplants, lichens

    cat(dir_in)
    flush.console()

    file_in <- "" # this is the html template

    file_ext <- c(".jpg", ".png")

    ## this defines recognized plot types with TOC items & figure legends
    ## this list also defines ordering of plot types
    graph_labels <- c(
        "map-pa", 
        "coef-pw", 

        "coef-veg", 
        "coef-soil", 

        "resid-soil", 
        "resid-veg",

        "map-rf-veg", 
        "map-cr-veg", 
        "map-df-veg", 

        "map-rf-soil", 
        "map-cr-soil", 
        "map-df-soil",

        "map-rf-all", 
        "map-cr-all", 
        "map-df-all", 

        "map-rf-cv", 
        "map-cr-cv")


    ## read in subdirs -- aka graph types
    subdirs <- list.dirs(dir_in, full.names=FALSE)[-1]
    tmp <- setdiff(subdirs, graph_labels)
    if (length(tmp) > 0) {
        cat("plot types not recognized:", paste(tmp, collapse=", "), "\n")
        subdirs <- subdirs[subdirs %in% graph_labels] # subset
    }
    subdirs <- subdirs[match(graph_labels, subdirs)] # ordering
    subdirs <- subdirs[!is.na(subdirs)]
    n_graph <- length(subdirs)

    ## read in file lists within subdirs
    files <- lapply(subdirs, function(dir) list.files(file.path(dir_in, dir)))
    names(files) <- subdirs
    ## strip file extensions to get species labels
    labels <- files
    for (i in seq_len(n_graph)) {
        tmp <- files[[i]]
        for (j in file_ext) {
            tmp <- gsub(j, "", tmp)
        }
        labels[[i]] <- tmp
    }
    all_spp <- unique(unlist(labels))
    all_spp <- all_spp[order(all_spp)]
    n_spp <- length(all_spp)

    ## graph indexing matrix
    M <- array(0L, dim=c(n_spp, length(graph_labels)), dimnames=list(all_spp, graph_labels))
    for (i in subdirs)
        M[labels[[i]][labels[[i]] %in% all_spp],i] <- 1L

    spptab <- read.csv(paste0(dir_in, "/taxa.csv"))
    rownames(spptab) <- spptab$label
    spptab$scinam <- as.character(spptab$scinam)
    spptab$comnam <- as.character(spptab$comnam)
    spptab$comnam[is.na(spptab$comnam)] <- ""
    spptab <- spptab[,c("scinam","comnam")]
    spptab$comnam[spptab$comnam == "VNA"] <- ""
    #spptab <- data.frame(
    #    scinam=c("Species scinama","Species scinamb","Species scinamc"),
    #    comnam=c("White species","Blue species","Red species"))
    #rownames(spptab) <- rownames(M)

    ## YAML front matter variables
    yaml_directives <- 
    function(spplabel, title_format="comnam (<em>scinam</em>)", layout="species")
    {
        i <- M[spplabel,]
        scinam <- as.character(spptab[spplabel, "scinam"])
        comnam <- as.character(spptab[spplabel, "comnam"])
        title <- title_format
        title <- sub("scinam", scinam, title)
        title <- sub("comnam", comnam, title)
        switches <- character(length(graph_labels))
        for (i in seq_len(length(graph_labels)))
            switches[i] <- paste0("  ", graph_labels[i], ": ",
                ifelse(M[spplabel, graph_labels[i]]==1, "true", "false"))
        taxonname <- switch(dir_in,
            "mites"="Soil mites",
            "mammals"="Mammals",
            "birds"="Birds",
            "mosses"="Bryophytes",
            "vplants"="Vascular plants",
            "lichens"="Lichens")
        out <- c("---",
            paste0("layout: ", layout),
            paste0("title: ", title),
            paste0("spplabel: ", spplabel),
            paste0("description: \"ABMI species summary for ", scinam, "\""),
            "sidebar: true",
            paste0("taxon: ", dir_in),
            paste0("taxonname: ", taxonname),
            "toclabels:",
            switches,
            "---")
        out
    }
    #spp <- all_spp[1]
    #yaml <- yaml_directives(spp, "<em>scinam</em>")
    #writeLines(yaml, paste0(spp, ".html"))

    #setwd("c:/Dropbox/www/species.abmi.ca/mites")
    #setwd("c:/p/AB_data_v2014/web/mites")
    #setwd("c:/p/AB_data_v2014/web/")
    for (spp in all_spp) {
        #yaml <- yaml_directives(spp, "<em>scinam</em>")
        if (dir_in %in% c("mites", "mosses", "lichens"))
            yaml <- yaml_directives(spp, "scinam")
        if (dir_in %in% c("mammals", "birds"))
            yaml <- yaml_directives(spp, "comnam (scinam)")
        if (dir_in == "vplants") {
            cn <- as.character(spptab[spp, "comnam"])
            if (cn == "")
                yaml <- yaml_directives(spp, "scinam")
            if (cn != "")
                yaml <- yaml_directives(spp, "comnam (scinam)")
        }
        writeLines(yaml, paste0(dir_in, "/", spp, ".html"))
    }


    ## generating index
    spptab0 <- spptab
    lead_vars <- if (dir_in %in% c("mammals","birds","vplants"))
        c("scinam", "comnam") else "scinam"
    for (lead_var in lead_vars) {

        spptab <- spptab0
        if (dir_in == "vplants" && lead_var == "comnam")
            spptab <- spptab[spptab$comnam != "",]
        tmp <- spptab[order(spptab[[lead_var]]),]
        lead <- substr(as.character(tmp[[lead_var]]), 1, 1)
        ulead <- unique(lead)

        sppfun <- function(i, tmp) {
            c(paste0("    - scinam: ", tmp$scinam[i]),
              paste0("      comnam: ", tmp$comnam[i]),
              paste0("      label: ", rownames(tmp)[i]))
        }
        res <- list()
        for (a in ulead) {
            lev1 <- c("-", paste0("  letter: ", a), "  species:")
            zz <- tmp[lead == a,,drop=FALSE]
            lev2 <- lapply(1:nrow(zz), sppfun, tmp=zz)
            res[[a]] <- c(lev1, lev2)
        }
        res <- unname(unlist(res))
        writeLines(res, paste0("c:/Dropbox/www/species.abmi.ca/_data/", dir_in, "_", substr(lead_var, 1, 3), ".yml"))

    }
    cat("\tdone\n")
}

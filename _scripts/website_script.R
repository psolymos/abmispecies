#TAXON <- c("mites", "mosses", "lichens","mammals", "birds", "vplants")
TAXON <- c("mites", "mosses", "lichens","mammals", "vplants")

## 1st we tidy up the species lookup tables
if (FALSE) {

ROOT <- "e:/peter/sppweb-html-content/species"
OUT <- "e:/peter/sppweb-pages/species"

#taxon <- "lichens"
for (taxon in TAXON) {

lt <- read.csv(file.path(ROOT, taxon, paste0(taxon, "-lookup.csv")))
rownames(lt) <- lt$sppid
f_TAX <- switch(taxon,
    "birds"="c:/p/AB_data_v2015/out/species/OUT_Birds_Species_Taxa_2015-05-22.csv",
    "lichens"="c:/p/AB_data_v2015/out/species/OUT_Lichens_Species_Taxa_2015-09-09.csv",
    "mammals"="c:/p/AB_data_v2015/out/species/OUT_Mammals_Species_Taxa_2015-06-01.csv",
    "mites"="c:/p/AB_data_v2015/out/species/OUT_Mites_Species_Taxa_2015-05-22.csv",
    "mosses"="c:/p/AB_data_v2015/out/species/OUT_Mosses_Species_Taxa_2015-06-09.csv",
    "vplants"="c:/p/AB_data_v2015/out/species/OUT_VPlants_Species_Taxa_2015-07-13.csv")
TAX <- read.csv(f_TAX)
rownames(TAX) <- TAX[,1]

if (taxon == "mammals") {
    lt$scinam <- as.character(TAX$SCIENTIFIC_NAME[match(rownames(lt), rownames(TAX))])
    lt$scinam[lt$sppid == "MartenFisher"] <- "Martes"
    lt$scinam[lt$sppid == "AllLeporids"] <- "Leporidae"
}
if (taxon == "mites") {
    lt$scinam <- as.character(TAX$SPECIES_OLD[match(rownames(lt), rownames(TAX))])
    lt$species <- as.character(lt$species)
    lt$species[] <- ""
}
if (taxon == "vplants") {
    lt$scinam <- as.character(TAX$SPECIES_OLD[match(rownames(lt), rownames(TAX))])
    lt$species <- as.character(TAX$COMMON_NAME[match(rownames(lt), rownames(TAX))])
}
if (taxon == "mosses") {
    lt$scinam <- as.character(lt$species)
    TAX$EA <- as.character(TAX$SCIENTIFIC_NAME)
    TAX$EA <- gsub(" ", "\\.", TAX$EA)
    lt$species <- as.character(TAX$COMMON_NAME[match(rownames(lt), TAX$EA)])
    lt$species[is.na(lt$species)] <- ""
    lt$species[lt$species == "VNA"] <- ""
}
if (taxon == "lichens") {
    lt$scinam <- as.character(lt$species)
    TAX$EA <- as.character(TAX$SCIENTIFIC_NAME)
    TAX$EA <- gsub(" ", "\\.", TAX$EA)
    lt$species <- as.character(TAX$COMMON_NAME[match(rownames(lt), TAX$EA)])
    lt$species[is.na(lt$species)] <- ""
    lt$species[lt$species == "VNA"] <- ""
}

lt <- droplevels(lt[lt$map.det,])
stopifnot(all(!is.na(lt)))
write.csv(lt, paste0("~/repos/abmispecies/_data/", taxon, ".csv"), row.names=FALSE)
}

}

ROOT <- "e:/peter/sppweb-html-content/species"
#TAXON <- c("mites", "mosses", "lichens","mammals", "birds", "vplants")
TAXON <- c("mites", "mosses", "lichens","mammals", "vplants")
OUT <- "e:/peter/sppweb-pages/species"

#for (taxon in TAXON)
taxon <- "mammals"
lt <- read.csv(file.path(ROOT, taxon, paste0(taxon, "-lookup.csv")))
rownames(lt) <- lt$sppid
f_TAX <- switch(taxon,
    "birds"="c:/p/AB_data_v2015/out/species/OUT_Birds_Species_Taxa_2015-05-22.csv",
    "lichens"="c:/p/AB_data_v2015/out/species/OUT_Lichens_Species_Taxa_2015-05-22.csv",
    "mammals"="c:/p/AB_data_v2015/out/species/OUT_Mammals_Species_Taxa_2015-06-01.csv",
    "mites"="c:/p/AB_data_v2015/out/species/OUT_Mites_Species_Taxa_2015-05-22.csv",
    "mosses"="c:/p/AB_data_v2015/out/species/OUT_Mosses_Species_Taxa_2015-06-09.csv",
    "vplants"="c:/p/AB_data_v2015/out/species/OUT_VPlants_Species_Taxa_2015-07-13.csv")
TAX <- read.csv(f_TAX)
rownames(TAX) <- TAX[,1]
setdiff(rownames(lt), rownames(TAX))
lt$scinam <- as.character(TAX$SCIENTIFIC_NAME[match(rownames(lt), rownames(TAX))])
lt <- droplevels(lt[lt$map.det,])

if (taxon == "mammals") {
    lt$scinam[lt$sppid == "MartenFisher"] <- "Martes"
    lt$scinam[lt$sppid == "AllLeporids"] <- "Leporidae"
}


cat(dir_in)
flush.console()
dir_in <- file.path(ROOT, taxon)
file_ext <- ".png"
dir_out <- file.path(OUT, taxon)

graph_labels <- matrix(c(
    "linear-north", "veghf.north",
    "linear-south", "soilhf.south",
    "map-cov-cr", "map.pred",
    "map-cr", "map.pred",
    "map-det", "map.det",
    "map-df", "map.pred",
    "map-rf", "map.pred",
    #"map-si", "map.pred",
    "sector-north", "veghf.north",
    "sector-south", "soilhf.south",
    "soilhf-nontreed-south", "soilhf.south",
    "soilhf-treed-south", "soilhf.south",
    "useavail-north", "useavail.north",
    "useavail-south", "useavail.south",
    "veghf-north", "veghf.north"),
    ncol=2, byrow=TRUE)
colnames(graph_labels) <- c("dir", "check")

file_in <- "" # this is the html template

M <- array(0L, dim=c(nrow(lt), nrow(graph_labels)), 
    dimnames=list(rownames(lt), graph_labels[,"dir"]))
for (i in 1:ncol(M))
    M[lt[[graph_labels[i,"check"]]],i] <- 1L

spptab <- lt[,c("scinam","species")]
colnames(spptab) <- c("scinam","comnam")
rownames(spptab) <- lt$sppid
spptab$scinam <- as.character(spptab$scinam)
spptab$comnam <- as.character(spptab$comnam)
spptab$comnam[is.na(spptab$comnam)] <- ""
spptab$comnam[spptab$comnam == "VNA"] <- ""

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
        switches <- character(nrow(graph_labels))
        #exts <- character(nrow(graph_labels))
        for (i in seq_len(nrow(graph_labels))) {
            switches[i] <- paste0("  ", graph_labels[i,"dir"], ": ",
                ifelse(M[spplabel, graph_labels[i,"dir"]]==1, "true", "false"))
#            ext <- if (is.null(files[[graph_labels[i]]]))
#                "" else strsplit(files[[graph_labels[i]]][1], "\\.")[[1]][2]
#            exts[i] <- paste0("  ", graph_labels[i], ": ", ext)
        }
        taxonname <- switch(taxon,
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
            paste0("taxon: ", taxon),
            paste0("taxonname: ", taxonname),
            "toclabels:",
            switches,
 #           "ext:",
 #           exts,
            "---")
        out
}
    #spp <- all_spp[1]
    #yaml <- yaml_directives(spp, "<em>scinam</em>")
    #writeLines(yaml, paste0(spp, ".html"))

    #setwd("c:/Dropbox/www/species.abmi.ca/mites")
    #setwd("c:/p/AB_data_v2014/web/mites")
    #setwd("c:/p/AB_data_v2014/web/")
for (spp in rownames(spptab)) {
        #yaml <- yaml_directives(spp, "<em>scinam</em>")
        if (taxon %in% c("mites", "mosses", "lichens"))
            yaml <- yaml_directives(spp, "scinam")
        if (taxon %in% c("mammals", "birds"))
            yaml <- yaml_directives(spp, "comnam (scinam)")

        if (taxon == "vplants") {
            cn <- as.character(spptab[spp, "comnam"])
            if (cn == "")
                yaml <- yaml_directives(spp, "scinam")
            if (cn != "")
                yaml <- yaml_directives(spp, "comnam (scinam)")
        }
        writeLines(yaml, file.path(dir_out, paste0(spp, ".html")))
}

## generating index
spptab0 <- spptab
lead_vars <- if (taxon %in% c("mammals","birds","vplants"))
    c("comnam", "scinam") else "scinam"
for (lead_var in lead_vars) {

        spptab <- spptab0

#!!!        if (dir_in == "vplants" && lead_var == "comnam")
#!!!            spptab <- spptab[spptab$comnam != "",]
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
        writeLines(res, file.path(OUT, paste0(taxon, "_", substr(lead_var, 1, 3), ".yml")))

    }





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
setwd("c:/p/AB_data_v2014/web2/raw/")

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

        "coef-veg-plus", 
        "coef-soil-plus", 

#        "resid-soil", 
#        "resid-veg",

#        "map-rf-veg", 
#        "map-cr-veg", 
#        "map-df-veg", 

#        "map-rf-soil", 
#        "map-cr-soil", 
#        "map-df-soil",

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
        exts <- character(length(graph_labels))
        for (i in seq_len(length(graph_labels))) {
            switches[i] <- paste0("  ", graph_labels[i], ": ",
                ifelse(M[spplabel, graph_labels[i]]==1, "true", "false"))
            ext <- if (is.null(files[[graph_labels[i]]]))
                "" else strsplit(files[[graph_labels[i]]][1], "\\.")[[1]][2]
            exts[i] <- paste0("  ", graph_labels[i], ": ", ext)
        }
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
            "ext:",
            exts,
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

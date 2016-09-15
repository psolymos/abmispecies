TAXON <- c("mites", "mosses", "lichens","mammals", "birds", "vplants","habitatelements")
#TAXON <- c("mites", "mosses", "lichens","mammals","birds")
#TAXON <- c("mites", "mosses", "lichens","mammals", "vplants")

## 1st we tidy up the species lookup tables
if (FALSE) {

ROOT <- "e:/peter/AB_data_v2016/out/birds/tables/lookup"
OUT <- "e:/peter/AB_data_v2016/out/birds/tables/lookup/pages"

#taxon <- "lichens"
for (taxon in TAXON) {

lt <- read.csv(file.path(ROOT, paste0(taxon, ".csv")))
rownames(lt) <- lt$sppid

lt <- droplevels(lt[lt$map.det,])
lt$useavail.north[lt$veghf.north] <- FALSE
lt$useavail.south[lt$soilhf.south] <- FALSE
if (taxon == "vplants") {
    lt$nonnative <- FALSE
    lt$nonnative[!is.na(lt$origin) & lt$origin == "Exotic"] <- TRUE
    tmp <- read.csv(file.path(ROOT, paste0(taxon, "_taxon.csv")))
    lt$species <- tmp$COMMON_NAME[match(rownames(lt), tmp$Analysis_Name)]
    lt$tsnid <- tmp$TSN_ID[match(rownames(lt), tmp$Analysis_Name)]
    lt$species[lt$species == "VNA"] <- NA
    lt <- droplevels(lt)
}
stopifnot(all(!is.na(lt[-which(colnames(lt)=="species")])))
write.csv(lt, paste0("~/repos/abmispecies/_data/", taxon, ".csv"), row.names=FALSE)
}

}

ROOT <- "~/repos/abmispecies/_data"
OUT <- if (interactive())
    "e:/peter/sppweb2016/pages/species" else "~/repos/abmispecies/pages/species"
OUT2 <- if (interactive())
    "e:/peter/sppweb2016/pages/species" else "~/repos/abmispecies/_data"

graph_labels <- matrix(c(
    "linear-north", "veghf.north",
    "linear-south", "soilhf.south",
    #"map-cov-cr", "map.pred",
    "map-sd-cr", "map.pred",
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

## YAML front matter variables
yaml_directives <-
function(spplabel, title_format="comnam (<em>scinam</em>)", layout="species", Prev=NA, Next=NA)
{
        i <- M[spplabel,]
        scinam <- as.character(spptab[spplabel, "scinam"])
        comnam <- as.character(spptab[spplabel, "comnam"])
        nnstatus <- ifelse(spptab[spplabel, "NN"], "nonnative", "native")
        title <- title_format
        title <- sub("scinam", scinam, title)
        title <- sub("comnam", comnam, title)
        switches <- character(nrow(graph_labels))
        for (i in seq_len(nrow(graph_labels))) {
            switches[i] <- paste0("  ", graph_labels[i,"dir"], ": ",
                ifelse(M[spplabel, graph_labels[i,"dir"]]==1, "true", "false"))
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
            #"sidebar: true",
            paste0("taxon: ", taxon),
            paste0("taxonname: ", taxonname),
            paste0("status: ", nnstatus),
            paste0("previous: ", ifelse(is.na(Prev), "", Prev)),
            paste0("next: ", ifelse(is.na(Next), "", Next)),
            "toclabels:",
            switches,
            "---")
        out
}

#if (interactive())
#    yaml_directives(rownames(spptab)[1])


#taxon <- "mosses"
for (taxon in TAXON) {

    lt <- read.csv(file.path(ROOT, paste0(taxon, ".csv")))
    rownames(lt) <- lt$sppid
    lt <- lt[order(lt$sppid),]
    lt$species <- as.character(lt$species)
    lt$species[is.na(lt$species)] <- ""

    M <- array(0L, dim=c(nrow(lt), nrow(graph_labels)),
        dimnames=list(rownames(lt), graph_labels[,"dir"]))
    for (i in 1:ncol(M))
        M[lt[[graph_labels[i,"check"]]],i] <- 1L

    spptab <- lt[,c("sppid","scinam","species")]
    colnames(spptab) <- c("sppid","scinam","comnam")
    spptab$FULL <- lt$map.pred
    spptab$NN <- if ("nonnative" %in% colnames(lt))
        lt$nonnative else FALSE
    if (taxon == "habitatelements")
        spptab$scinam <- spptab$comnam

    if (!dir.exists(file.path(OUT, taxon)))
        dir.create(file.path(OUT, taxon))

    for (i in 1:nrow(spptab)) {

        spp <- rownames(spptab)[i]
        Prev <- if (i == 1)
            NA else as.character(spptab$sppid[i-1])
        Next <- if (i == nrow(spptab))
            NA else as.character(spptab$sppid[i+1])

        FORMAT <- if (spptab[spp, "comnam"] == "")
            "scinam" else "comnam (scinam)"
        if (taxon == "habitatelements")
            FORMAT <- "comnam"
        yaml <- yaml_directives(spp, FORMAT, Prev=Prev, Next=Next)
        writeLines(yaml, file.path(OUT, taxon, paste0(spp, ".html")))
    }

    ## generating index
    spptab0 <- spptab
    lead_vars <- if (taxon %in% c("mammals","birds","vplants"))
        c("comnam", "scinam") else "scinam"
    if (taxon == "habitatelements")
        lead_vars <- "comnam"
    for (lead_var in lead_vars) {

        spptab <- spptab0

        if (taxon == "vplants" && lead_var == "comnam")
            spptab <- spptab[spptab$comnam != "",]
        tmp <- spptab[order(spptab[[lead_var]]),]
        lead <- substr(as.character(tmp[[lead_var]]), 1, 1)
        ulead <- unique(lead)

        sppfun <- function(i, tmp) {
            c(paste0("    - scinam: ", tmp$scinam[i]),
              paste0("      comnam: ", tmp$comnam[i]),
              paste0("      label: ", rownames(tmp)[i]),
              paste0("      model: ", ifelse(tmp$FULL[i], "true", "false")))
        }
        res <- list()
        for (a in ulead) {
            lev1 <- c("-", paste0("  letter: ", a), "  species:")
            zz <- tmp[lead == a,,drop=FALSE]
            lev2 <- lapply(1:nrow(zz), sppfun, tmp=zz)
            res[[a]] <- c(lev1, lev2)
        }
        res <- unname(unlist(res))
        writeLines(res, file.path(OUT2, paste0(taxon, "_", substr(lead_var, 1, 3), ".yml")))
    }
}

## updating summary file
TAXON <- TAXON[TAXON != "habitatelements"]
tabs <- list()
cols <- c("map.det", "useavail.north", "useavail.south",
    "map.pred", "veghf.north", "soilhf.south")
for (i in paste0(ROOT, "/", TAXON, ".csv"))
    tabs[[i]] <- read.csv(i)
nums <- t(sapply(tabs, function(z) colSums(z[,cols])))
rownames(nums) <- TAXON
nums <- rbind(nums, all=colSums(nums))
nums <- data.frame(names=rownames(nums), nums)
colnames(nums) <- gsub("\\.", "", colnames(nums))
nums$mapdetonly <- nums$mapdet - nums$mappred
write.csv(nums, paste0(ROOT, "/summary.csv"), row.names=FALSE)

q('no')

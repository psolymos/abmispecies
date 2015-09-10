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
lt$useavail.north[lt$veghf.north] <- FALSE
lt$useavail.south[lt$soilhf.south] <- FALSE
stopifnot(all(!is.na(lt)))
write.csv(lt, paste0("~/repos/abmispecies/_data/", taxon, ".csv"), row.names=FALSE)
}

}

ROOT <- "~/repos/abmispecies/_data"
#TAXON <- c("mites", "mosses", "lichens","mammals", "birds", "vplants")
TAXON <- c("mites", "mosses", "lichens","mammals", "vplants")
OUT <- if (interactive())
    "e:/peter/sppweb-pages/species" else "~/repos/abmispecies/pages/species"
OUT2 <- if (interactive())
    "e:/peter/sppweb-pages/species" else "~/repos/abmispecies/_data"

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
            "sidebar: true",
            paste0("taxon: ", taxon),
            paste0("taxonname: ", taxonname),
            "toclabels:",
            switches,
            "---")
        out
}


#taxon <- "mosses"
for (taxon in TAXON) {

    lt <- read.csv(file.path(ROOT, paste0(taxon, ".csv")))
    rownames(lt) <- lt$sppid
    lt$species <- as.character(lt$species)
    lt$species[is.na(lt$species)] <- ""

    M <- array(0L, dim=c(nrow(lt), nrow(graph_labels)), 
        dimnames=list(rownames(lt), graph_labels[,"dir"]))
    for (i in 1:ncol(M))
        M[lt[[graph_labels[i,"check"]]],i] <- 1L

    spptab <- lt[,c("scinam","species")]
    colnames(spptab) <- c("scinam","comnam")

    if (!dir.exists(file.path(OUT, taxon)))
        dir.create(file.path(OUT, taxon))

    for (spp in rownames(spptab)) {
        FORMAT <- if (spptab[spp, "comnam"] == "")
            "scinam" else "comnam (scinam)"
        yaml <- yaml_directives(spp, FORMAT)
        writeLines(yaml, file.path(OUT, taxon, paste0(spp, ".html")))
    }

    ## generating index
    spptab0 <- spptab
    lead_vars <- if (taxon %in% c("mammals","birds","vplants"))
        c("comnam", "scinam") else "scinam"
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
        writeLines(res, file.path(OUT2, paste0(taxon, "_", substr(lead_var, 1, 3), ".yml")))
    }
}

q('no')

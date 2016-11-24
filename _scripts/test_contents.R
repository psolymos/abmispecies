## accounting for all the bits that are linked

ROOT <- "v:/contents/2016/species"
TAXA <- c("birds","lichens","mammals","mites","mosses","vplants")
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

#i <- "birds"
res <- list()
for (i in TAXA) {
    ii <- list()
    tab <- read.csv(paste0("~/repos/abmispecies/_data/", i, ".csv"))
    SPP <- as.character(tab$sppid)
    for (j in 1:nrow(graph_labels)) {
        spp <- SPP[tab[,graph_labels[j,"check"]]]
        fl <- gsub(".png", "", list.files(file.path(ROOT, i, graph_labels[j,"dir"])))
        ## figs that should be there but it is not
        ii[[graph_labels[j,"dir"]]] <- setdiff(spp, fl)
    }
    res[[i]] <- ii
}

unlist(res)


## adding TSN id

for (i in c("lichens","mammals","mites","mosses","vplants")) {
    tab <- read.csv(paste0("~/repos/abmispecies/_data/", i, ".csv"))
    tsn <- read.csv(paste0("e:/peter/sppweb2016/round01/tables/ABMI-species-", i, ".csv"))
    tab$tsnid <- tsn$TSNID[match(tab$sppid, tsn$SpeciesID)]
    write.csv(tab, row.names=FALSE, file=paste0("~/repos/abmispecies/_data/", i, ".csv"))
}

## jumbo list of all the species, comparing with SAR listings

library(mefa4)
cn <- c("sppid", "species", "scinam", "tsnid",
    "ndet",
    "map.det", "veghf.north", "soilhf.south", "map.pred", "useavail.north",
    "useavail.south", "comments")
res <- list()
for (i in TAXA) {
    tab <- read.csv(paste0("~/repos/abmispecies/_data/", i, ".csv"))
    res[[i]] <- data.frame(taxon=i, tab[,cn])
}

tab <- do.call(rbind, res)
rownames(tab) <- tab$sppid
write.csv(tab, file="e:/peter/sppweb2016/round01/tables/ABMI-species-all.csv")

lst <- read.csv("e:/peter/sppweb2016/round01/tables/SPCC-Lookup-Website_2016-10-18_v1.1.csv")
lst$SpeciesIDnorm <- normalizeNames(lst$SpeciesName, pattern = list(" "), replacement = list("."))
compare_sets(tab$sppid, lst$SpeciesID)
compare_sets(tab$sppid, lst$SpeciesIDnorm)
lst$web_sppid <- NA
lst$web_taxon <- NA

for (i in 1:nrow(tab)) {
    id <- rownames(tab)[i]
    if (id %in% as.character(lst$SpeciesID)) {
        j <- which(as.character(lst$SpeciesID) == id)
        lst$web_sppid[j] <- id
        lst$web_taxon[j] <- as.character(tab[id, "taxon"])
    }
    if (id %in% as.character(lst$SpeciesIDnorm)) {
        j <- which(as.character(lst$SpeciesIDnorm) == id)
        lst$web_sppid[j] <- id
        lst$web_taxon[j] <- as.character(tab[id, "taxon"])
    }
}
table(is.na(lst$web_sppid))
length(unique(lst$web_sppid[!is.na(lst$web_sppid)]))
table(table(lst$web_sppid))

write.csv(lst, row.names=FALSE,
    file="e:/peter/sppweb2016/round01/tables/SPCC-Lookup-Website_2016-11-24_v1.1.csv")

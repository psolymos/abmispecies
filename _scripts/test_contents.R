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

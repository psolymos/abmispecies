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
setwd("c:/Dropbox/www/species.abmi.ca/")
dir_in <- "mites" # this is the root dir for a taxon

file_in <- "" # this is the html template

file_ext <- ".png"

## this defines recognized plot types with TOC items & figure legends
## this list also defines ordering of plot types
graph_labels <- c("map","pw")

## read in subdirs -- aka graph types
subdirs <- dir(dir_in)
tmp <- setdiff(subdirs, graph_labels)
if (length(tmp) > 0) {
    cat("plot types not recognized:", paste(tmp, collapse=", "), "\n")
    subdirs <- subdirs[subdirs %in% graph_labels] # subset
}
subdirs <- subdirs[match(graph_labels, subdirs)] # ordering
n_graph <- length(subdirs)

## read in file lists within subdirs
files <- lapply(subdirs, function(dir) list.files(file.path(dir_in, dir)))
names(files) <- subdirs
## strip file extensions to get species labels
labels <- files
for (i in seq_len(n_graph))
    labels[[i]] <- sub(file_ext, "", files[[i]])
all_spp <- unique(unlist(labels))
all_spp <- all_spp[order(all_spp)]
n_spp <- length(all_spp)

## graph indexing matrix
M <- array(0L, dim=c(n_spp, n_graph), dimnames=list(all_spp, subdirs))
for (i in subdirs)
    M[labels[[i]][labels[[i]] %in% all_spp],i] <- 1L

library(mefa4)
load("c:/Dropbox/abmi/intactness/habcomp/OUT_mites_2014-06-06.Rdata")

spptab <- taxa(m)[all_spp,]
spptab$scinam <- spptab$SPECIES_OLD
spptab$scinam <- as.character(spptab$scinam)
spptab$comnam <- spptab$COMMON_NAME
spptab$comnam <- as.character(spptab$comnam)
spptab$comnam[is.na(spptab$comnam)] <- ""
spptab <- spptab[,c("scinam","comnam")]
#spptab <- data.frame(
#    scinam=c("Species scinama","Species scinamb","Species scinamc"),
#    comnam=c("White species","Blue species","Red species"))
#rownames(spptab) <- rownames(M)

## YAML front matter variables
yaml_directives <- 
function(spplabel, title_format="comnam (<em>scinam</em>)")
{
    i <- M[spplabel,]
    scinam <- as.character(spptab[spplabel, "scinam"])
    comnam <- as.character(spptab[spplabel, "comnam"])
    title <- title_format
    title <- sub("scinam", scinam, title)
    title <- sub("comnam", comnam, title)
    switches <- character(n_graph)
    for (i in seq_len(n_graph))
        switches[i] <- paste0("  ", graph_labels[i], ": ",
            ifelse(M[spplabel, graph_labels[i]]==1, "true", "false"))
    out <- c("---",
        "layout: species",
        paste0("title: ", title),
        paste0("spplabel: ", spplabel),
        paste0("description: \"ABMI species summary for ", scinam, "\""),
        "sidebar: true",
        paste0("taxon: ", dir_in),
        "toclabels:",
        switches,
        "---")
    out
}
spp <- all_spp[1]
yaml <- yaml_directives(spp, "<em>scinam</em>")
#writeLines(yaml, paste0(spp, ".html"))

setwd("c:/Dropbox/www/species.abmi.ca/mites")
for (spp in all_spp) {
    yaml <- yaml_directives(spp, "<em>scinam</em>")
    writeLines(yaml, paste0(spp, ".html"))
}


## generating index
tmp <- spptab[order(spptab$scinam),]
lead <- substr(as.character(tmp$scinam), 1, 1)
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
writeLines(res, "c:/Dropbox/www/species.abmi.ca/_data/mites_sci.yml")
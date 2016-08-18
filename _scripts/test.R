DIR1 <- "~/repos/abmispecies/_data"
DIR2 <- "~/repos/abmispecies/pages/testspecies"

spptab <- read.csv(file.path(DIR1, "birds2.csv"))
rownames(spptab) <- spptab$sppid
spptab <- spptab[order(spptab$family, spptab$species),]

cat("read tab\n")
warnings()

## YAML front matter variables
yaml_directives <-
function(spplabel, title_format="comnam (<em>scinam</em>)", layout="testspecies",
Prev=NA, Next=NA)
{
        scinam <- as.character(spptab[spplabel, "scinam"])
        comnam <- as.character(spptab[spplabel, "species"])
        title <- title_format
        title <- sub("scinam", scinam, title)
        title <- sub("comnam", comnam, title)
        out <- c("---",
            paste0("layout: ", layout),
            paste0("title: ", title),
            paste0("spplabel: ", spplabel),
            paste0("description: \"ABMI species summary for ", scinam, "\""),
            #"sidebar: true",
            paste0("taxon: ", "birds"),
            paste0("taxonname: ", "Birds"),
            paste0("singing: ", ifelse(spptab[spplabel, "singing"], "true", "false")),
            paste0("previous: ", ifelse(is.na(Prev), "", Prev)),
            paste0("next: ", ifelse(is.na(Next), "", Next)),
            paste0("family: ", as.character(spptab[spplabel, "family"])),
            "---")
        out
}
if (interactive())
    yaml_directives(rownames(spptab)[1])

for (i in 1:nrow(spptab)) {
    spp <- rownames(spptab)[i]
    Prev <- if (i == 1)
        NA else as.character(spptab$species[i-1])
    Next <- if (i == nrow(spptab))
        NA else as.character(spptab$species[i+1])
    yaml <- yaml_directives(spp, Prev=Prev, Next=Next)
    writeLines(yaml, file.path(DIR2, "birds", paste0(spp, ".html")))
}

cat("write headers\n")
warnings()

## generating index
spptab0 <- spptab
lead_vars <- c("comnam", "scinam")
for (lead_var in lead_vars) {
    spptab <- spptab0
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
    writeLines(res, file.path(DIR1, paste0("birds2_", substr(lead_var, 1, 3), ".yml")))
}

cat("write toc\n")
warnings()

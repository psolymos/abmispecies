## zip each file of a certain extension in a folder
## e.g. each asc raster file becomes a seperate zip archive
library(utils)

inlib <- "w:/climate/raster"
outlib <- "w:/climate/raster"
ext <- ".asc"

fl <- list.files(inlib)
fl <- fl[grepl(ext, fl)]

for (f in fl) {
#    cat("zipping", f, "\n")
    flush.console()
    inf <- file.path(inlib, f)
    outf <- file.path(outlib, paste0(substr(f, 1, nchar(f)-nchar(ext)), ".zip"))
    zip(outf, inf)
}

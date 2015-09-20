## zip each file of a certain extension in a folder
## e.g. each asc raster file becomes a seperate zip archive
## optionally including some common files with each
## e.g. README.md

library(utils)

zip_files_in_folder <-
function(inlib, outlib, ext, extras=character(0))
{
    wd <- getwd()
    on.exit(setwd(wd))
    setwd(inlib)
    fl <- list.files()
    fl <- fl[grepl(ext, fl)]
    for (f in fl) {
        flush.console()
        #inf <- file.path(inlib, f)
        outf <- file.path(outlib, paste0(substr(f, 1, nchar(f)-nchar(ext)), ".zip"))
        zip(outf, c(f, extras))
    }
    invisible(NULL)
}

zip_files_in_folder("w:/climate/raster", "w:/climate/raster", ".asc",
    c("README.md"))

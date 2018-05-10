library(magick)

DIR <- "v:/contents/2018/species/mammals-camera/map-df"

fl <- list.files(DIR)

#i <- 1
for (i in fl) {
    fig <- image_read(file.path(DIR, i))
    fig_png <- image_convert(fig, "png")
    image_write(fig_png, file.path(DIR, gsub(".jpg", ".png", i)))
}

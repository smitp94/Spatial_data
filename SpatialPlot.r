
library(ggmap)

plot_rgdl <- function(){
  ogr <- readOGR(dsn = "mygeodata/placemarks.shp")
  osm <- read_osm(ogr)
  tm_shape(osm) + tm_raster() + tm_shape(ogr) + tm_dots(size = 1, col='red')
}

plot_ggplot <- function(){
  file<-importShapefile("mygeodata/placemarks")
  df <- data.frame(file)
  map<-get_map(location = c(df['X'][1,],df['Y'][1,]),zoom = 15)
  ggmap(map) + geom_point(data=df, aes(x=X, y=Y), color='red')
}

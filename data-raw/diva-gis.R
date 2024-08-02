#' ## Diva-GIS Data 

#' Downloaded from the Diva-GIS Website (http://www.diva-gis.org/gdata)

filedir <- "/home/matt/Documents/diva-gis"

# Load Bolivian Water Data 
diva_water_areas_bol <- sf::st_read(paste0(filedir, "/BOL_water_areas_dcw.shp"))
diva_water_lines_bol <- sf::st_read(paste0(filedir, "/BOL_water_lines_dcw.shp"))
# Water lines is similar to the hydrosheds data

plot(sf::st_geometry(diva_water_lines_bol))
plot(sf::st_geometry(diva_water_areas_bol))

# Save water lines, areas
save(diva_water_lines_bol, file=paste0(filedir, "/diva_water_lines_bol.rda"), compress="xz")
save(diva_water_areas_bol, file=paste0(filedir, "/diva_water_areas_bol.rda"), compress="xz")

# Load land-cover data
diva_cover_bol <- raster::stack(paste0(filedir, "/BOL_cov.grd"))
raster::plot(diva_cover_bol)
diva_cover_bol <- as.data.frame(raster::rasterToPoints(diva_cover_bol))
# Save data
save(diva_cover_bol, file="data/diva_cover_bol.rda", compress="xz")

# Load population data
diva_pop_bol <- raster::stack(paste0(filedir, "/bol_pop.grd"))
raster::plot(diva_pop_bol)
diva_pop_deu <- as.data.frame(raster::rasterToPoints(diva_pop_bol))
# Save data
save(diva_pop_deu , file="data/diva_pop_bol.rda", compress="xz")

# Load Bolivian road and railroad data
diva_roads_bol <- sf::st_read(paste0(filedir, "/BOL_roads.shp"))
diva_rails_bol <- sf::st_read(paste0(filedir, "/BOL_rails.shp"))

# Save roads and rails of Bolivia
save(diva_roads_bol, file="data/diva_roads_bol.rda", compress="xz")
save(diva_rails_bol, file="data/diva_rails_bol.rda", compress="xz")

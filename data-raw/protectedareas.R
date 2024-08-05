#' ---
#' title: "Protected area data for Chiquitos"
#' author: "MattB-SF"
#' ---

rm(list=ls()); gc()
library(sf); library(terra); library(dplyr)

# Set file directory
filedir <- "/home/matt/Documents/Wissenschaft/Data/WDPA"

# Download PAs of Bolivia
download.file("https://d1gam3xoknrgr2.cloudfront.net/current/WDPA_WDOECM_Jul2024_Public_BOL_shp.zip",
              destfile=paste0(filedir, "/WDPA_WDOECM_Jul2024_Public_BOL_shp.zip"))
# Can be downloaded from protectedplanet.net, but is updated every month, 
# you have to adjust the month and year according to the current date.

# Unzip shapefile
unzip(paste0(filedir, "/WDPA_WDOECM_Jul2024_Public_BOL_shp.zip"), exdir = filedir)

# Read PA file
pa_bol_poly <- sf::st_read(dsn=paste0(filedir, "/WDPA_WDOECM_Jul2024_Public_BOL_shp_0/WDPA_WDOECM_Jul2024_Public_BOL_shp-polygons.shp"))
pa_bol_point <- sf::st_read(dsn=paste0(filedir, "/WDPA_WDOECM_Jul2024_Public_BOL_shp_0/WDPA_WDOECM_Jul2024_Public_BOL_shp-points.shp"))
pa_bol_poly1 <- sf::st_read(dsn=paste0(filedir, "/WDPA_WDOECM_Jul2024_Public_BOL_shp_1/WDPA_WDOECM_Jul2024_Public_BOL_shp-polygons.shp"))
pa_bol_point1 <- sf::st_read(dsn=paste0(filedir, "/WDPA_WDOECM_Jul2024_Public_BOL_shp_1/WDPA_WDOECM_Jul2024_Public_BOL_shp-points.shp"))
pa_bol_poly2 <- sf::st_read(dsn=paste0(filedir, "/WDPA_WDOECM_Jul2024_Public_BOL_shp_2/WDPA_WDOECM_Jul2024_Public_BOL_shp-polygons.shp"))
pa_bol_point2 <- sf::st_read(dsn=paste0(filedir, "/WDPA_WDOECM_Jul2024_Public_BOL_shp_2/WDPA_WDOECM_Jul2024_Public_BOL_shp-points.shp"))
pa_bol_poly <- bind_rows(list(pa_bol_poly, pa_bol_poly1, pa_bol_poly2)); rm(pa_bol_poly1, pa_bol_poly2); gc()
pa_bol_point <- bind_rows(list(pa_bol_point, pa_bol_point1, pa_bol_point2)); rm(pa_bol_point1, pa_bol_point2); gc()

# Check if points lie outside polygons
pa_bol_out <- pa_bol_point[which(lengths(st_within(pa_bol_point, pa_bol_poly))==0),]
pa_bol <- bind_rows(pa_bol_poly, pa_bol_point); rm(pa_bol_point); gc()

# Load outline of Chiquitos
load("data/chiquitos.rda")

# Subset PAs by extent of Chiquitos

# Identify intersections
pa_bol_lst <- sf::st_intersects(pa_bol, chiquitos)

# Subset data
pa_chi <- pa_bol[which(lengths(pa_bol_lst) > 0),]
unique(pa_chi$SUB_LOC)

# Check non of the left-out PAs are in Bavaria
pa_non_chi <- pa_bol[which(lengths(pa_bol_lst) == 0),]
unique(pa_non_chi$SUB_LOC)

#Save to file
save(pa_chi, file="data/pa_chi.rda", compress="xz")

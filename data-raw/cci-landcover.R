#' ---
#' title: "Create CCI data for Chiquitos"
#' author: "MattB-SF"
#' ---

rm(list=ls()); gc()

## CCI Land-cover data

# Information on the data can be found here:
# http://maps.elie.ucl.ac.be/CCI/viewer/download.php

# Data for 1992 - 2015 ist available from:
# ftp://geo10.elie.ucl.ac.be/CCI/LandCover/byYear/

# Data for 2016-2020 is available from:
# https://cds.climate.copernicus.eu/cdsapp#!/dataset/satellite-land-cover?tab=form

# Specify file directory
filedir <- "/home/matt/Documents/Wissenschaft/Data/LC_CCI/"

# Define filenames
years <- 1992:2022
#filenames <- paste0("ESACCI-LC-L4-LCCS-Map-300m-P1Y-", years, "-v2.0.7.nc")

# Download files
#lapply(filenames, function(x){download.file(paste0("", x), destfile=paste0(filedir, x))})

# Load files
files1 <- list.files(filedir, pattern=".tif", full.names=T)
files2 <- list.files(filedir, pattern=".nc", full.names=T)
dat1 <- terra::rast(files1)
dat2 <- terra::rast(files2, subds="lccs_class")
dat <- c(dat1, dat2); rm(dat1, dat2)

# Crop by extent of bavaria
load("data/chiquitos.rda")
r_cci_chi <- terra::mask(terra::crop(dat, chiquitos, snap="out"), sf::st_buffer(chiquitos, 10000))
names(r_cci_chi) <- years
r_cci_chi
raster::plot(r_cci_chi[[1]])
cci_chi <- raster::mask(r_cci_chi, chiquitos)
raster::plot(cci_chi[[1]])
cci_chi
rm(dat); gc()

# Save to file
library(dplyr)
round10 <- function(x, na.rm = FALSE) round(x/10, digits=0)*10
cci_chi <- as.data.frame(cci_chi, xy=TRUE) %>% 
  mutate_at(vars(-c(x,y)), round10) %>%
  mutate_at(vars(-c(x,y)), factor, 
            levels = seq(0,220, by=10), 
            labels=c("No Data", "Cropland, rainfed", "Cropland, irrigated or post-flooding",
                     "Mosaic cropland (>50%) / natural vegetation (tree, shrub, herbaceous cover) (<50%)",
                     "Mosaic natural vegetation (tree, shrub, herbaceous cover) (>50%) / cropland (<50%)",
                     "Tree cover, broadleaved, evergreen, closed to open (>15%)",
                     "Tree cover, broadleaved, deciduous, closed to open (>15%)",
                     "Tree cover, needleleaved, evergreen, closed to open (>15%)",
                     "Tree cover, needleleaved, deciduous, closed to open (>15%)",
                     "Tree cover, mixed leaf type (broadleaved and needleleaved)",
                     "Mosaic tree and shrub (>50%) / herbaceous cover (<50%)",
                     "Mosaic herbaceous cover (>50%) / tree and shrub (<50%)", "Shrubland", "Grassland", "Lichens and mosses", 
                     "Sparse vegetation (tree, shrub, herbaceous cover) (<15%)", "Tree cover, flooded, fresh or brakish water", 
                     "Tree cover, flooded, saline water", "Shrub or herbaceous cover, flooded, fresh/saline/brakish water",
                     "Urban areas", "Bare areas", "Water bodies", "Permanent snow and ice"))
colnames(cci_chi) <- c("x", "y", years)
head(cci_chi)
save(cci_chi, file="data/cci_chi.rda", compress="xz")

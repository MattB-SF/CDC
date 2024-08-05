#' ---
#' title: "Create Worldclim data for Bolivia"
#' author: "MattB-SF"
#' ---

rm(list=ls()); gc()

# Load libraries
library(tidyverse); library(sf)

# Load shapefile of bavaria
load("data/chiquitos.rda")
filedir <- "/home/matt/Documents/Wissenschaft/Data/"

# Get current Worldclim data
bol_wc1 <- geodata::worldclim_country(country="Bolivia", var='tmin', res=0.5, path=filedir)
bol_wc2 <- geodata::worldclim_country(country="Bolivia", var='tmax', res=0.5, path=filedir)
bol_wc3 <- geodata::worldclim_country(country="Bolivia", var='tavg', res=0.5, path=filedir)
bol_wc4 <- geodata::worldclim_country(country="Bolivia", var='prec', res=0.5, path=filedir)
bol_wc5 <- geodata::worldclim_country(country="Bolivia", var='srad', res=0.5, path=filedir)
bol_wc6 <- geodata::worldclim_country(country="Bolivia", var='wind', res=0.5, path=filedir)
#bol_wc7 <- geodata::worldclim_country(country="Bolivia", var='vapr', res=0.5, path=filedir)
bol_wc7 <- geodata::worldclim_country(country="Bolivia", var='bio', res=0.5, path=filedir)

ext_chi <- terra::ext(chiquitos)
(chi_wc1 <- terra::crop(bol_wc1, ext_chi, snap="out"))
(chi_wc2 <- terra::crop(bol_wc2, ext_chi, snap="out"))
(chi_wc3 <- terra::crop(bol_wc3, ext_chi, snap="out"))
(chi_wc4 <- terra::crop(bol_wc4, ext_chi, snap="out"))
(chi_wc5 <- terra::crop(bol_wc5, ext_chi, snap="out"))
(chi_wc6 <- terra::crop(bol_wc6, ext_chi, snap="out"))
(chi_wc7 <- terra::crop(bol_wc7, ext_chi, snap="out"))
#(chi_wc8 <- raster::crop(bol_wc8, ext_chi, snap="out"))

chi_wc <- c(chi_wc1, chi_wc2, chi_wc3, chi_wc4, chi_wc5, chi_wc6, chi_wc7)

# Turn into data.frame and save to file
chi_wc <- as.data.frame(chi_wc, xy=TRUE)
(colnames(chi_wc) <- gsub("BOL_", "", colnames(chi_wc)))
head(chi_wc)
assign(paste0("wc2.1_30s_chi"), value=chi_wc)
save(list=paste0("wc2.1_30s_chi"), file=paste0("data/wc2.1_30s_chi.rda"), compress="xz")

# Get future Worldclim data
var <- c("tmin", "tmax", "prec", "bio")
model <- c("GD", "HE", "IP", "MC") #c("AC", "BC", "CC", "CE", "CN", "GF", "GD", "GS", "HD", "HG", "HE", "IN", "IP", "MI", "MR", "MC", "MP", "MG", "NO")
rcp <- c(26, 45, 60, 85)
year <- c(50, 70)
df <- expand.grid(var=var, model=model, rcp=rcp, year=year)

dat <- mapply(function(var, rcp, model, year){
  cmip6_tile(lon, lat, model, ssp, time, var, path, ...)
  #raster::getData('CMIP5', var=var, rcp=rcp, model=model, year=year, res=0.5, lon=11.5, lat=49, path=filedir)
  },
  var=df$var, rcp=df$rcp, model=df$model, year=df$year)


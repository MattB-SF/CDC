#' ## Extract biotime data for Bavaria

# Available for download from here: https://biotime.st-andrews.ac.uk/download_form.php?dl=csv_download

#' Please cite as detailed below when using BioTIME:

#' Dornelas M, Antão LH, Moyes F, Bates, AE, Magurran, AE, et al. BioTIME: 
#' A database of biodiversity time series for the Anthropocene. 
#' Global Ecol Biogeogr. 2018; 27:760 - 786. https://doi.org/10.1111/geb.12729

filedir <- "/home/matt/Documents/Wissenschaft/Data/BioTime/"

biotime <-read.csv(paste0(filedir, "BioTIMEQuery_24_06_2021.csv")) #### use the latest version from download site ####

#' Alternatively, you can load the query from the ZENODO repository

#fullquery<-read.csv(url(https://zenodo.org/record/1095627))

#' Get GADM data of Bolivia
bol <- geodata::gadm(country="BOL", level=1, path=getwd())
terra::ext(bol)

# Subset locations by extent of Bolivia
library(dplyr)
colnames(biotime)
biotime_bol <- biotime %>% filter(LONGITUDE >= -71 & LONGITUDE <= -56) %>% filter(LATITUDE >= -24 & LATITUDE <= -8)
head(biotime_bol)
save(biotime_bol, file="data/biotime_bol.rda", compress="xz")

#' Plot locations of data entries
library(sp)
coordinates(biotime_bol) <- ~LONGITUDE+LATITUDE
plot(biotime_bol, col="red")
plot(bol, add=T)

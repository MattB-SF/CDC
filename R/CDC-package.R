#' CDC: Chiquitos Data Cube
#' 
#' @name CDC package
#' @aliases CDCpackage
#' @title CDC: Chiquitos Data Cube
#' @description R package to access various data sources, i.e. elevation, climate and land-use data, for the Chiquitos region in Bolivia. 
#' @author MattB-SF
#' @keywords package
NULL
#'
#' @docType data
#' @name alt_chi
#' @title altitudinal and terrain data of Chiquitos
#' @description NASA SRTM v3.0 elevation data of Bavaria, Germany
#' @usage data(alt_bav_tk4tel)
#' @details Elevation and terrain data of Bavaria, Germany derived from NASA SRTM 3 Arc Sec v3.0 data and 
#' resampled onto the TK4tel grid. Terrain variables were calculated using the raster::terrain() function. 
#' Data includes information on altitude, aspect, slope, hillshade (calculated from slope and aspect), 
#' Terrain Ruggedness Index (tri), Topographic Position Index (tpi), 
#' Topographic Position Index with neighborhood size 5 (tpi5), roughness and flow direction (flowdir).
#' @format A \code{data.frame} with 2268 observations and 11 variables.
#' @source This data has been obtained from: \itemize{\item \url{https://gdex.cr.usgs.gov/gdex/}}
NULL
#'
#' @docType data
#' @name amphibians_chi
#' @title amphibian range maps for the extent of Chiquitos
#' @description  IUCN Amphibian ranges with Chiquitos, Bolivia
#' @usage data(amphibians_bav)
#' @details shapefiles of the global IUCN ranges of all amphibian species that intersect with the extent of Chiquitos 
#' @format A \code{data.frame} with 23 observations and 26 variables.
#' @source This data has been obtained from: 
#' \itemize{\item \url{https://www.iucnredlist.org/resources/spatial-data-download}}
NULL
#'
#' @docType data
#' @name biotime_bol
#' @title bioTime data for Bolivia
#' @description biodiversity time series trends from the BioTime database for Bolivia
#' @usage data(biotime_bol)
#' @details Biodiversity time series trends extracted from the BioTime database for the 
#' extent of Bolivia. For Chiquitos and Bolivia no data is available, but some data is available for Chile (which is provided here).
#' @format A \code{data.frame} with 206 observation and 15 variables.
#' @source This data has been obtained from: \itemize{\item \url{https://biotime.st-andrews.ac.uk/download_form.php?dl=csv_download}}
#' @references Dornelas M, Antao LH, Moyes F, Bates, AE, Magurran, AE, et al. BioTIME: 
#' A database of biodiversity time series for the Anthropocene. 
#' Global Ecol Biogeogr. 2018; 27:760-786. \url{https://doi.org/10.1111/geb.12729}
NULL
#'
#' @docType data
#' @name bolivia
#' @title administrative boundary of bolivia
#' @description GADM outline of Bolivia
#' @usage data(bolivia)
#' @details Administrative boundary of Bolivia derived from GADM data.
#' @format A \code{data.frame} with 1 observation and 3 variables.
#' @source This data has been obtained from: \itemize{\item \url{https://www.gadm.org/data.html}}
NULL
#'
#' @docType data
#' @name cci_chi
#' @title CCI land cover data of chiquitos
#' @description CCI land cover data of Chiquitos, Bolivia
#' @usage data(cci_chi)
#' @details CCI land cover data of Chiquitos, Bolivia at a resolution of 300m. 
#' CCI Land cover are global land cover maps at 300m spatial resolution based on MERIS and SPOT satellite data. 
#' Data includes annual information from 1992 - 2022.
#' @format A \code{data.frame} with 1122489 observations and 31 variables.
NULL
#'
#' @docType data
#' @name chi_pop_1km
#' @title Population density of Chiquitos
#' @description  Population density in Chiquitos, Bolivia
#' @usage data(bav_pop_1km)
#' @details Population density of Chiquitos at a resolution of 1km2
#' @format A \code{data.frame} with 70552 observations and 5 variables.
NULL
#'
#' @docType data
#' @name chiquitos
#' @title administrative boundary of chiquitos
#' @description GADM outline of Chiquitos, Bolivia
#' @usage data(chiquitos)
#' @details Administrative boundary of Chiquitos, Bolivia derived from GADM data.
#' @format A \code{data.frame} with 1 observation and 14 variables.
#' @source This data has been obtained from: \itemize{\item \url{https://www.gadm.org/data.html}}
NULL
#'
#' @docType data
#' @name pa_chi
#' @title protected area data of chiquitos
#' @description IUCN protected area data of Chiquitos, Bolivia
#' @usage data(pa_chi)
#' @details Protected area data of Chiquitos, Bolivia derived from the World Database on Protected Areas 
#' @format A \code{data.frame} with 8 observations and 31 variables.
#' @source Cite this dataset as: \itemize{\item UNEP-WCMC and IUCN (2019), Protected Planet: 
#' The World Database on Protected Areas (WDPA) On-line, July/2019, Cambridge, UK: UNEP-WCMC and IUCN. 
#' Available at: \url{https://protectedplanet.net.}.}
NULL
#'
#' @docType data
#' @name santa_cruz
#' @title administrative boundary of santa cruz
#' @description GADM outline of Santa Cruz, Bolivia
#' @usage data(santa_cruz)
#' @details Administrative boundary of Santa Cruz, Bolivia derived from GADM data.
#' @format A \code{data.frame} with 1 observation and 12 variables.
#' @source This data has been obtained from: \itemize{\item \url{https://www.gadm.org/data.html}}
NULL
#'
#' @docType data
#' @name wc2.1_30s_chi
#' @title worldclim data of chiquitos
#' @description Current worldclim temperature, precipitation and bioclim data of Chiquitos, Bolivia
#' @usage data(wc2.1_30s_chi)
#' @details Current temperature, precipitation, solar radiation, wind and bioclimatic data of Chiquitos, Bolivia derived 
#' from 30 seconds Worldclim v2.1. Data is derived from interpolations of observed data representative of xx - xx.
#' @format A \code{data.frame} with 92600 observation and 93 variables.
#' @source Cite this dataset as: \itemize{\item Hijmans, R.J., S.E. Cameron, J.L. Parra, P.G. Jones and A. Jarvis, 2005. 
#' Very high resolution interpolated climate surfaces for global land areas. 
#' International Journal of Climatology 25: 1965-1978.}
#' This data has been downloaded from: \itemize{\item \url{https://worldclim.org/version1}}
NULL
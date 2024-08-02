#' CDC: Chiquitania Data Cube
#' 
#' @name CDC package
#' @aliases CDCpackage
#' @docType package
#' @title CDC: Chiquitania Data Cube
#' @description R package to access various data sources, i.e. elevation, climate and land-use data, for the Chiquitania region in Bolivia. 
#' @author MattB-SF
#' @keywords package
NULL
#'
#' @docType data
#' @name alt_bav_tk4tel
#' @title altitudinal and terrain data of bavaria
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
#' @name amphibians_bav
#' @title amphibian range maps for the extent of Bavaria
#' @description  IUCN Amphibian ranges with Bavaria, Germany
#' @usage data(amphibians_bav)
#' @details shapefiles of the global IUCN ranges of all amphibian species that intersect with the extent of Bavaria 
#' @format A \code{data.frame} with 23 observations and 26 variables.
#' @source This data has been obtained from: 
#' \itemize{\item \url{https://www.iucnredlist.org/resources/spatial-data-download}}
NULL
#'
#' @docType data
#' @name aves_tk4tel
#' @title Aves gridded data of Bavaria
#' @description Aves gridded data of Bavaria, Germany
#' @usage data(aves_tk4tel)
#' @details Aves gridded data of Bavaria, Germany
#' @format A \code{data.frame} with 4623 observations and 5 variables.
#' @source This data has been digitized from the Bavarian Atlas of Birds.
NULL
#'
#' @docType data
#' @name bav_pop_1km
#' @title Population density of Bavaria
#' @description  Population density in Bavaria, Germany
#' @usage data(bav_pop_1km)
#' @details Population density of Bavaria at a resolution of 1km2
#' @format A \code{data.frame} with 70552 observations and 5 variables.
#' @references Schug, F., Frantz, D., van der Linden, S., & Hostert, P. (2021). 
#'  Gridded population mapping for Germany based on building density, height and type from 
#'  Earth Observation data using census disaggregation and bottom-up estimates. 
#'  PLOS ONE. \url{10.1371/journal.pone.0249044}
NULL
#'
#' @docType data
#' @name bavaria
#' @title administrative boundary of bavaria
#' @description GADM outline of Bavaria, Germany
#' @usage data(bavaria)
#' @details Administrative boundary of Bavaria, Germany derived from GADM data.
#' @format A \code{data.frame} with 1 observation and 13 variables.
#' @source This data has been obtained from: \itemize{\item \url{https://www.gadm.org/data.html}}
NULL
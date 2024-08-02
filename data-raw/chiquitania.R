#' ## Create SpatialPolygonsDataFrame of Bolivia

#' Get GADM data of Bolivia
bolivia <- geodata::gadm(country="BOL", level=0, path=getwd())
bol1 <- geodata::gadm(country="BOL", level=1, path=getwd())
bol2 <- geodata::gadm(country="BOL", level=2, path=getwd())

#' Subset data by NAME_1
santa_cruz <- bol1[bol1$NAME_1 == "Santa Cruz",]
sp::plot(bol)
sp::plot(santacruz, add=T, col="red")

#' Subset data by NAME_2
chiquitos <- bol2[bol2$NAME_2 == "Chiquitos",]
sp::plot(bol)
sp::plot(santacruz, add=T, col="red")
sp::plot(chiquitos, add=T, col="blue")

#' Save to file
bolivia <-  sf::st_as_sf(bolivia)
save(bolivia, file="data/bolivia.rda", compress="xz")

santa_cruz <- sf::st_as_sf(santa_cruz)
save(santa_cruz, file="data/santa_cruz.rda", compress="xz")

chiquitos <- sf::st_as_sf(chiquitos)
save(chiquitos, file="data/chiquitos.rda", compress="xz")

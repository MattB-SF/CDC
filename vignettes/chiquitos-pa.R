## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = T, comment = NA, warning=F, message=F, eval=F, 
  echo=T, error=F, comment = "#>", fig.path="../figures/"
)

## ----pa-overview, fig.width=6, fig.height=7, eval=F---------------------------
#  # Load CDC & ggplot2 package
#  library(CDC); library(dplyr); library(sf); library(ggplot2); library(tidyr)
#  
#  # Create colour scheme
#  redblue <- rev(colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan",
#                                    "yellow", "#FF7F00", "red", "#7F0000"))(255))
#  
#  # Load pa data from bavDC package
#  data(pa_chi, package="CDC")
#  unique(pa_chi$iucn_cat)
#  pa_chi$iucn_cat <- factor(pa_chi$iucn_cat,
#                                   levels=c("I", "II", "III", "IV", "V", "Not.Assigned",
#                                            "Not.Applicable", "Not.Reported", "Total"),
#                                   labels=c("I", "II", "III", "IV", "V", "Not Assigned",
#                                            "Not Applicable", "Not Reported", "Total"))
#  
#  # Plot percentage cover by iucn cat
#  pa_chi %>% filter(var == "perc_cov") %>%
#    ggplot() + geom_tile(aes(x=x, y=y, fill=value)) +
#    facet_wrap(iucn_cat ~.) + coord_sf(ndiscr=0) +
#    theme_classic() + labs(x="", y="") +
#    scale_fill_gradientn(name="% Cover", na.value= "grey50", colours=redblue) +
#    theme(strip.background = element_blank(),
#          strip.text = element_text(size=12, face="bold"),
#          legend.position=c(0.85,0.15))
#  
#  # Plot number of PAs by iucn cat
#  pa_chi %>% filter(var == "no_pa") %>%
#    ggplot() + geom_tile(aes(x=x, y=y, fill=value)) +
#    facet_wrap(iucn_cat ~.) + coord_sf(ndiscr=0) +
#    theme_classic() + labs(x="", y="") +
#    scale_fill_gradientn(name="Number of PAs", na.value= "grey50", colours=redblue) +
#    theme(strip.background = element_blank(),
#          strip.text = element_text(size=12, face="bold"),
#          legend.position=c(0.85,0.15))
#  
#  # Plot minimum year by iucn cat
#  pa_chi %>% filter(var == "min_year") %>%
#    ggplot() + geom_tile(aes(x=x, y=y, fill=value)) +
#    facet_wrap(iucn_cat ~.) + coord_sf(ndiscr=0) +
#    theme_classic() + labs(x="", y="") +
#    scale_fill_gradientn(name="First year", na.value= "grey50", colours= redblue) +
#    theme(strip.background = element_blank(),
#          strip.text = element_text(size=12, face="bold"),
#          legend.position=c(0.85,0.15))

## ----pa-cormat, fig.width=6, fig.height=5, eval=F-----------------------------
#  data("dist_pa_chi")
#  dist_pa_chi$value <- dist_pa_chi$dist
#  dist_pa_chi$var <- "dist"
#  
#  dat <- pa_chi %>% bind_rows(dist_pa_chi %>% dplyr::select(-dist)) %>%
#    tidyr::spread(var, value) %>%
#    mutate(iucn_cat2 = factor(.$iucn_cat,
#                              levels=c("Ia", "Ib", "II", "III", "IV", "V", "VI",
#                                       "Not.Assigned", "Not.Applicable",
#                                       "Not.Reported", "Total"),
#                              labels=c("I", "I", "II", "III", "IV", "V", "VI",
#                                       "Not designated", "Not designated",
#                                       "Not designated", "Total"))) %>%
#    dplyr::select(-iucn_cat) %>% group_by(x,y, iucn_cat2) %>%
#    summarise(min_year = min(min_year, na.rm=T),
#              no_pa = sum(no_pa, na.rm=T),
#              perc_cov = sum(perc_cov, na.rm=T),
#              dist = min(dist, na.rm=T)) %>%
#    tidyr::gather(var, value, -c(x,y,iucn_cat2)) %>%
#    unite("var", c(iucn_cat2, var), sep="_") %>%
#    tidyr::spread(var, value) %>%
#    ungroup() %>%
#    dplyr::select(-c(x,y)) %>% tidyr::drop_na()
#  dat <- dat %>% dplyr::select(c(Total_dist, Total_min_year, Total_no_pa, Total_perc_cov,
#                                 II_no_pa, II_perc_cov, III_no_pa, III_perc_cov,
#                                 IV_no_pa, IV_perc_cov))
#  #summary(dat)
#  
#  # Check correlations (as scatterplots), distribution and print correlation coefficient
#  #ggpairs(dat)
#  
#  # Check correlation between variables
#  #cor(dat)
#  
#  # Nice visualization of correlations
#  # GGally, to assess the distribution and correlation of variables
#  #library(GGally)
#  #ggcorr(dat, method = c("everything", "pearson"), label=T)
#  
#  ## producing the correlation matrix
#  ggstatsplot::ggcorrmat(
#    data = dat ## data from which variable is to be taken
#    #cor.vars = lifeExp:gdpPercap ## specifying correlation matrix variables
#  )

## ----pa-summary_table, asis="TRUE", eval=F------------------------------------
#  # Load bavarian PA data
#  data(pa_chi)
#  pa_chi$iucn_cat <- factor(pa_chi$iucn_cat,
#                                   levels=c("I", "II", "III", "IV", "V", "Not.Assigned",
#                                            "Not.Applicable", "Not.Reported", "Total"),
#                                   labels=c("I", "II", "III", "IV", "V", "Not Assigned",
#                                            "Not Applicable", "Not Reported", "Total"))
#  
#  pa_chi <- pa_chi %>% filter(var == "perc_cov") %>% dplyr::select(-var)
#  colnames(pa_chi) <- c("x", "y", "IUCN Category", "perc_cov")
#  pa_chi %>% group_by(`IUCN Category`) %>%
#    mutate(perc_cov = tidyr::replace_na(perc_cov, 0)) %>%
#    summarise(`Minimum`=min(perc_cov), `Mean`=mean(perc_cov), `Max`=max(perc_cov)) %>%
#    knitr::kable(format="pipe")

## ----pa-dist, fig.width=6, fig.height=6, eval=F-------------------------------
#  library(scico); library(ggthemes)
#  data("dist_pa_chi")
#  dist_pa_chi %>% filter(iucn_cat == "Total") %>%
#    ggplot() + geom_tile(aes(x=x, y=y, fill=dist)) +
#    geom_sf(data=bavaria_gk, colour="black", fill=NA) + coord_sf() +
#    scale_fill_scico(name="PA distance", palette="roma") + theme_map() +
#    theme(legend.position = c(0.1,0.23))

## ----pa-map_eng, fig.width=8, fig.height=6, eval=F----------------------------
#  data("pa_chi")
#  ggplot() + geom_sf(data=pa_chi, aes(fill=DESIG_ENG), col=NA) +
#    geom_sf(data=bavaria_gk, fill=NA) + theme_minimal()

## ----pa-map_eng_sub, fig.width=7, fig.height=8, eval=F------------------------
#  pa_chi$DESIG_ENG <- factor(pa_chi$DESIG_ENG)
#  levels(pa_chi$DESIG_ENG)[5] <- "Ramsar Site"
#  levels(pa_chi$DESIG_ENG)[6] <- "Site of Community Importance"
#  levels(pa_chi$DESIG_ENG)[7] <- "Special Protection Area"
#  
#  # names of the areas to plot and their colour
#  my_cols = data.frame(Names=c("Special Protection Area", #(Birds Directive)"
#                               "Site of Community Importance", #(Habitats Directive)
#                               "Nature Reserve",
#                               "National Park",
#                               "Ramsar Site"), #, Wetland of International Importance
#                       Color=c("hotpink3",
#                               "burlywood",
#                               "darkolivegreen1",
#                               "forestgreen",
#                               "steelblue"))
#  my_cols$Names = as.character(my_cols$Names)
#  my_cols$Color = as.character(my_cols$Color) # making sure they are not factors
#  
#  #plot bavaria
#  par(bg="transparent")
#  plot(sf::st_geometry(bavaria_gk))
#  #loop through areas and plot them
#  for(i in 1:length(my_cols[,1])){
#    pa_bav %>% filter(DESIG_ENG == my_cols[i,1]) %>%
#      st_geometry() %>% plot(col=my_cols[i,2], add=T)
#  }
#  #plot bavaria again
#  plot(sf::st_geometry(bavaria_gk), add=T)
#  # the areas some-times overwrite the borders, that's not very pretty
#  legend("bottom", legend = c(my_cols[,1]), cex =0.8, fill=my_cols[,2],
#         bty="n", xpd = T, inset = c(0,-0.1))


CDC: Chiquitos Data Cube
================

## Installation

You can install CDC from github with:

``` r
# Install remotes if not available
if(!"remotes" %in% installed.packages()[,"Package"]) install.packages("remotes")

# Install baVDC package from Github
remotes::install_github("MattB-SF/CDC", build_vignettes = T)
```

If package installation with `install_github()` fails, try this as an
alternative:

``` r
tmp_zip <- tempfile(fileext = ".zip")
source_url <- "https://api.github.com/repos/MattB-SF/CDC/zipball/main"
utils::download.file(source_url, destfile=tmp_zip, method="wget")
file.exists(tmp_zip)

remotes::install_local(tmp_zip)
```

After installation, simply load the `bavDC` package:

``` r
library(CDC)
```

**If you encounter a bug or if you have any problems, please file an
[issue](https://github.com/MattB-SF/CDC/issues) on Github.**

## Shiny app

You can start the CDC Shiny app, by:

``` r
library(shiny)
runApp()
```

**Please note:** The app currently only supports the `alt_chi` dataset.

## Datasets

The individual datasets can then be loaded, by:

**Note:** The code of how the datasets were created can be found in the
[data-raw](https://github.com/MattB-SF/CDC/tree/main/data-raw) folder.

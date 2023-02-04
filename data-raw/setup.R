.pkg_dev <- c(
  "targets",
  "usethis",
  "devtools",
  "here",
  "roxygen2"
)

.pkg_imports <- c(
  "tidyverse",
  "future.apply",
  "data.table",
  "gt",
  "BayesFactor",
  "spcadjust",
  "arrow"
)

.pkg_extra <- c(
  # "OpenML",
  # "ldbounds", # Package ‘ldbounds’ was built under R version 4.2.2
  # "evmix", # Not available for R Version 4.2 (copy code from package)
  "isotree",
  "ranger"
)

.pkgs <- c(.pkg_imports, .pkg_dev, .pkg_extra)

#### Load/install dependencies ####
suppressPackageStartupMessages({
  loaded <- sapply(.pkgs, require, character.only = TRUE)
  to_install <- .pkgs[!loaded]
  if (length(to_install) > 0) {
    suppressWarnings({
      install.packages(to_install, dependencies = TRUE)
    })
    installed <- sapply(to_install, require, character.only = TRUE)
    loaded <- c(loaded, to_install)
    rm(installed)
  }
  rm(loaded, to_install)
})

#### Load 'dsos' and 'annie' package ####
devtools::load_all(file.path(Sys.getenv("HOME"), "dsos"))
devtools::load_all()

#### Make data.table aware ####
.datatable.aware <- TRUE

#### Configure OpenML ####
# OpenML::setOMLConfig(
#   apikey = NULL,
#   cachedir = NULL,
#   verbosity = 2
# )

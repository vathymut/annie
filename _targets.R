# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
# library(tarchetypes) # Load other packages as needed. # nolint

# Source other scripts as needed. # nolint
source("data-raw/setup.R")

# Set target options:
tar_option_set(
  packages = .pkg_imports,
  format = "rds"
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multiprocess")

# tar_make_future() configuration (okay to leave alone):
future::plan(future.callr::callr)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()

# Replace the target list below with your own:
list(
  tar_target(
    name = gamma_cfg,
    command = config_gamma(),
    format = "parquet"
  ),
  tar_target(
    name = gamma_simulated,
    command = simulate_gamma(gamma_cfg),
    format = "parquet"
  )
)

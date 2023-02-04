config_gamma <- function(shapes = c(1, sqrt(2), 2),
                         scales = c(2, sqrt(2), 1)) {
  config <- data.table::data.table(
    shape = shapes,
    scale = scales
  )
  config[, id := .I]
  return(config)
}

simulate_gamma <- function(gamma_cfg, n = 1e7) {
  simulated <- gamma_cfg[
    ,
    list(x = stats::rgamma(n = n, shape = shape, scale = scale)),
    by = id
  ]
  return(simulated)
}

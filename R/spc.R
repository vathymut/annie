# Formula for standard error: https://stackoverflow.com/a/2677859/1965432
#' @noRd
#' @keywords  internal
se <- function(x) sqrt(var(x) / length(x))

#' @noRd
#' @keywords  internal
alert_from_os <- function(os_train,
                          os_test,
                          delta = 0,
                          nrep = 500,
                          target = 0.05) {
  chart <- new(
    "SPCCUSUM",
    model = spcadjust::SPCModelNonparCenterScale(Delta = delta)
  )
  xihat <- spcadjust::xiofdata(chart, os_train)
  n_target <- length(os_test)
  calibrated <- spcadjust::SPCproperty(
    data = os_train,
    nrep = nrep,
    property = "calhitprob",
    chart = chart,
    params = list(target = target, nsteps = n_target),
    quiet = TRUE
  )
  chart_path <- spcadjust::runchart(chart, newdata = os_test, xi = xihat)
  alerted <- any(chart_path > calibrated@res)
  return(alerted)
}

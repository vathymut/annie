# Functions to reproduce results from the paper:
# https://osf.io/qny5x/
#
# Schönbrodt, F. D., Wagenmakers, E. J., Zehetleitner, M., & Perugini, M. (2017).
# Sequential hypothesis testing with Bayes factors: Efficiently testing mean differences.
# Psychological methods, 22(2), 322.

#' @noRd
bf_ttest <- function(os_train, os_test, iterations = 4000) {
  samples <- BayesFactor::ttestBF(
    os_train,
    os_test,
    posterior = TRUE,
    iterations = iterations
  )
  mu <- unname(samples[, "mu"])
  pr_over <- sum(mu > 0) / iterations
  bf10 <- pr_over / (1 - pr_over)
  return(bf10)
}

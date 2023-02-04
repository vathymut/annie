
# `annie`

<!-- badges: start -->
<!-- badges: end -->

The goal of `annie` is to run experiments comparing the Bayesian version of
D-SOS to the frequentist approach and other methods. These methods are
statistical tests for adverse shifts.

<details>
<summary>Why <em>annie</em>?</summary>
<br>
I called it <a href="https://youtu.be/CDl9ZMfj6aE"><em>annie</em></a> because
<strong>are you OK?</strong> (are you worse off) is the pertinent
<a href="https://vathymut.org/posts/2023-01-03-are-you-ok/">question</a>.
</details>

## Installation

Install the development version of `annie` from [GitHub](https://github.com/)
with:

``` r
library(devtools)
devtools::install_github("vathymut/annie")
```

## Run scripts

To run all the experiments:

``` r
library(targets)
tar_make()
```

## Reference

This is in support of a forthcoming (unpublished) manuscript as cited below:

``` bibtex
@unpublished{kamulete2023bayes,
  author = {Kamulete, Vathy M},
  title  = {Are you OK? A Bayesian test for adverse shift},
  year   = {2023}
}
```

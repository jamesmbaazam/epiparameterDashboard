
<!-- README.md is generated from README.Rmd. Please edit that file. -->
<!-- The code to render this README is stored in .github/workflows/render-readme.yaml -->
<!-- Variables marked with double curly braces will be transformed beforehand: -->
<!-- `packagename` is extracted from the DESCRIPTION file -->
<!-- `gh_repo` is extracted via a special environment variable in GitHub Actions -->

# epiparameterDashboard <img src="man/figures/logo.svg" align="right" width="120" alt="" />

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit/)
[![R-CMD-check](https://github.com/jamesmbaazam/epiparameterDashboard/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jamesmbaazam/epiparameterDashboard/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/jamesmbaazam/epiparameterDashboard/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jamesmbaazam/epiparameterDashboard?branch=main)
[![lifecycle-concept](https://raw.githubusercontent.com/reconverse/reconverse.github.io/master/images/badge-concept.svg)](https://www.reconverse.org/lifecycle.html#concept)
<!-- badges: end -->

epiparameterDashboard provides a dashboard to explore the database of
epidemiological parameters provided by the
[epiparameter](epiverse-trace/epiparameter) package.

## Demo

Access the live dashboard
[here](https://james-mba-azam.shinyapps.io/epiparameterdashboard/).

If you prefer to run the dashboard locally, you can do so with the
following code:

``` r
# Install pak if not already installed
if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

# Install the package
pak::pak("jamesmbaazam/epiparameterDashboard")

# Load the package
library(epiparameterDashboard)

# Run the dashboard
epiparameterDashboard()
```

## Development

### Lifecycle

This package is currently a *concept*, as defined by the [RECON software
lifecycle](https://www.reconverse.org/lifecycle.html). This means that
essential features and mechanisms are still being developed, and the
package is not ready for use outside of the development team.

### Contributions

Contributions are welcome via [pull
requests](https://github.com/jamesmbaazam/epiparameterDashboard/pulls).

### Related projects

This project is related to other existing projects in R or other
languages, but also differs from them in the following aspects:

### Code of Conduct

Please note that the epiparameterDashboard project is released with a
[Contributor Code of
Conduct](https://github.com/epiverse-trace/.github/blob/main/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.

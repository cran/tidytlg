## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(dplyr)
library(tidytlg)

## ----message=FALSE------------------------------------------------------------
tbl <- cdisc_adsl %>%
  univar(colvar = "TRT01PN",
         rowvar = "AGE",
         statlist = statlist(c("N", "MEANSD", "MEDIAN", "RANGE", "IQRANGE")),
         decimal = 0,
         row_header = "Age (Years)")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  univar(colvar = "TRT01PN",
         rowvar = "AGE",
         statlist = statlist(c("N", "MEAN_CI", "GeoMEAN_CI")),
         decimal = 0,
         row_header = "Age (Years)")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  univar(colvar = "TRT01PN",
         rowvar = "BMIBL",
         decimal = 2,
         row_header = "Age (Years)")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_advs %>%
  univar(colvar = "TRTAN",
         rowvar = "AVAL",
         rowbyvar = "PARAMCD",
         precisionby = "PARAMCD",
         decimal = 4)

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_advs %>%
  filter(PARAMCD == "SYSBP") %>%
  univar(colvar = "TRTAN",
         rowvar = "CHG",
         precisionon = "CHG",
         decimal = 4)

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_advs %>%
  filter(PARAMCD == "SYSBP") %>%
  univar(colvar = "TRTAN",
         rowvar = "AVAL",
         rowbyvar = "PARAMCD",
         precisionby = "PARAMCD",
         precisionon = "CHG",
         decimal = 4)

knitr::kable(tbl)


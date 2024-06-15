## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(dplyr)
library(tidytlg)

## -----------------------------------------------------------------------------
column_metadata <-
  tibble::tribble(
    ~tbltype, ~coldef, ~decode,                ~span1,
    "type1",  "0",     "Placebo",              "",
    "type1",  "54",    "Low Dose",             "Xanomeline",
    "type1",  "81",    "High Dose",            "Xanomeline",
    "type1",  "54+81", "Total Xanomeline",     ""
  )
column_metadata

## -----------------------------------------------------------------------------
data("cdisc_adsl")
adsl <- cdisc_adsl %>%
  filter(ITTFL == "Y") %>%
  select(USUBJID, TRT01PN, TRT01P, ITTFL, SEX, RACE, AGE)
glimpse(adsl)

## ----echo = FALSE-------------------------------------------------------------
paste0("Dimensions prior to the tlgsetup call are ", dim(adsl)[1] , " rows and ", dim(adsl)[2], " columns.")

## ----warning=FALSE------------------------------------------------------------
setup_table <- tlgsetup(adsl,
                        var = "TRT01PN",
                        column_metadata = column_metadata)
glimpse(setup_table)

## ----echo = FALSE-------------------------------------------------------------
paste0("Dimensions after to the rmtsetup call are ", dim(setup_table)[1] , " rows and ", dim(setup_table)[2], " columns.")

## -----------------------------------------------------------------------------
setup_table %>%
  group_by(colnbr) %>%
  count()


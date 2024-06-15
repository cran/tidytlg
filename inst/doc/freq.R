## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(dplyr)
library(tidytlg)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  freq(colvar = "TRT01PN",
       rowvar = "ITTFL",
       statlist = statlist("n"),
       subset = ITTFL == "Y",
       rowtext = "Analysis set: ITT")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  freq(colvar = "TRT01PN",
       rowvar = "SEX",
       statlist = statlist(c("N","n (x.x%)")),
       row_header = "Sex")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  mutate(SEX = factor(SEX, levels = c("M", "F"), labels = c("Male", "Female"))) %>%
  freq(colvar = "TRT01PN",
       rowvar = "SEX",
       statlist = statlist(c("N","n (x.x%)")),
       row_header = "Sex")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  mutate(SEX = factor(SEX, levels = c("M", "F"), labels = c("Male", "Female"))) %>%
  freq(colvar = "TRT01PN",
       rowvar = "SEX",
       statlist = statlist("n/N (x.x%)"),
       row_header = "Sex")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  mutate(SEX = factor(SEX, levels = c("M", "F"), labels = c("Male", "Female"))) %>%
  freq(colvar = "TRT01PN",
       rowbyvar = "SEX",
       rowvar = "AGEGR1",
       statlist = statlist(c("N","n (x.x%)"), denoms_by = c("SEX", "TRT01PN")),
       row_header = "Age group")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  freq(colvar = "TRT01PN",
       rowbyvar = "ETHNIC",
       rowvar = "RACE",
       statlist = statlist(c("N","n (x.x%)")),
       row_header = "Race")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  freq(colvar = "TRT01PN",
       rowbyvar = "ETHNIC",
       rowvar = "RACE",
       statlist = statlist(c("N","n (x.x%)")),
       row_header = "Race",
       pad = FALSE)

knitr::kable(tbl)

## -----------------------------------------------------------------------------
adae <- cdisc_adae %>%
  rename(TRT01AN = TRTAN)

tbl <- adae %>%
  freq(denom_df = cdisc_adsl,
       colvar = "TRT01AN",
       rowvar = "AEDECOD",
       descending_by = "81")

knitr::kable(head(tbl, 10))

## -----------------------------------------------------------------------------
tbl <- adae %>%
  freq(denom_df = cdisc_adsl,
       colvar = "TRT01AN",
       rowvar = "AEDECOD",
       rowbyvar = "AESEV",
       statlist = statlist(c("n (x.x)"), denoms_by = "TRT01AN"))

knitr::kable(head(tbl, 10))

## ----message=FALSE------------------------------------------------------------
adae <- cdisc_adae %>%
  filter(SAFFL == "Y", TRTEMFL == "Y") %>%
  filter(AEBODSYS %in% c("GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS","SKIN AND SUBCUTANEOUS TISSUE DISORDERS")) %>%
  rename(TRT01AN = TRTAN)

adsl <- cdisc_adsl %>%
  filter(SAFFL == "Y")

## -----------------------------------------------------------------------------
tbl <- nested_freq(adae,
                   denom_df = adsl,
                   colvar = "TRT01AN",
                   rowvar = "AEBODSYS*AEDECOD",
                   statlist = statlist("n (x.x%)"),
                   descending_by = "81",
                   row_header = "System organ class \\\n Preferred term")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- nested_freq(adae,
                   denom_df = adsl,
                   colvar = "TRT01AN",
                   rowvar = "AEBODSYS*AEDECOD",
                   statlist = statlist("n (x.x%)"),
                   descending_by = "81",
                   cutoff = 2,
                   cutoff_stat = "n",
                   row_header = "System organ class \\\n Preferred term")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- nested_freq(adae,
                   denom_df = adsl,
                   colvar = "TRT01AN",
                   rowvar = "AEBODSYS*AEDECOD",
                   statlist = statlist("n (x.x%)"),
                   descending_by = "81",
                   cutoff = "81 >= 2",
                   cutoff_stat = "n",
                   row_header = "System organ class \\\n Preferred term")

knitr::kable(tbl)


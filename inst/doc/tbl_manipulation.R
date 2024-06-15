## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE------------------------------------------------------------
library(dplyr)
library(tidytlg)

tbl <- tibble::tribble(
               ~label,      ~col1,      ~col2,      ~col3,
  "Analysis Set: ITT",       "86",       "84",       "84",
        "Age (Years)",         NA,         NA,         NA,
                  "N",       "86",       "84",       "84"
)

knitr::kable(tbl)

# render tbl
gentlg(huxme       = tbl,
          format      = "HTML",
          orientation = "landscape",
          opath       = ".",
          file        = "DEMO1",
          title       = "Basic tbl without formatting",
          colheader   = c("", "Placebo", "Active 1", "Active 2"),
          print.hux = FALSE,
          wcol        = .30)

## -----------------------------------------------------------------------------
tbl <- tbl %>%
  mutate(newrows = case_when(label == "Age (Years)" ~ 1,
                             TRUE ~ 0))

knitr::kable(tbl)

# render tbl
gentlg(huxme       = tbl,
          format      = "HTML",
          orientation = "landscape",
          opath       = ".",
          file        = "DEMO2",
          title       = "Adding the variable of newrows",
          colheader   = c("", "Placebo", "Active 1", "Active 2"),
          print.hux = FALSE,
          wcol        = .30)

## -----------------------------------------------------------------------------
tbl <- tbl %>%
  mutate(indentme = case_when(label == "N" ~ 1,
                             TRUE ~ 0))

knitr::kable(tbl)

# render tbl
gentlg(huxme       = tbl,
          format      = "HTML",
          orientation = "landscape",
          opath       = ".",
          file        = "DEMO3",
          title       = "Adding the variable of indentme",
          colheader   = c("", "Placebo", "Active 1", "Active 2"),
          print.hux = FALSE,
          wcol        = .30)

## -----------------------------------------------------------------------------
tbl <- tbl %>%
  mutate(boldme = case_when(label == "Age (Years)" ~ 1,
                             TRUE ~ 0))

knitr::kable(tbl)

# render tbl
gentlg(huxme       = tbl,
          format      = "HTML",
          orientation = "landscape",
          opath       = ".",
          file        = "DEMO4",
          title       = "Adding the variable of boldme",
          colheader   = c("", "Placebo", "Active 1", "Active 2"),
          print.hux = FALSE,
          wcol        = .30)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  univar(colvar = "TRT01PN",
         rowvar = "AGE",
         statlist = statlist(c("N", "MEANSD")),
         decimal = 0,
         row_header = "Age (Years)") %>%
  mutate(anbr = "01")

knitr::kable(tbl)

## -----------------------------------------------------------------------------
tbl <- cdisc_adsl %>%
  univar(colvar = "TRT01PN",
         rowvar = "AGE",
         statlist = statlist(c("N", "MEANSD")),
         decimal = 0,
         row_header = "Age (Years)") %>%
  mutate(anbr = "01") %>%
  add_format()

knitr::kable(tbl)

# render tbl
gentlg(huxme       = tbl,
          tlf         = "Table",
          format      = "HTML",
          orientation = "landscape",
          opath       = ".",
          file        = "DEMO5",
          title       = "Using row_type to set up indentation",
          colheader   = c("", "Placebo", "Active 1", "Active 2"),
          print.hux = FALSE,
          wcol        = .30)


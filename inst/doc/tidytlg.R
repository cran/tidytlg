## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "figures"
)

working_dir <- tempdir()

## ----echo=FALSE, out.width = "600px"------------------------------------------
knitr::include_graphics("titles.PNG")

## ----echo=FALSE, out.width = "500px"------------------------------------------
knitr::include_graphics("column_metadata.PNG")

## ----echo=FALSE, out.width = "600px", out.height = "60px"---------------------
knitr::include_graphics("column_header.PNG")

## ----message=FALSE------------------------------------------------------------
# Prep Environment -------------------------------------------------------------------------------------
library(dplyr)
library(haven)
library(tidytlg)

# read adsl from PhUSE test data factory
testdata <- "https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/"
adsl <- read_xpt(url(paste0(testdata,"adsl.xpt")))

## ----message=FALSE------------------------------------------------------------
# Process Data -----------------------------------------------------------------------------------------
adsl <- adsl %>%
  filter(ITTFL == "Y") %>%
  mutate(SEX = factor(SEX, levels = c("M", "F", "U"), labels = c("Male", "Female", "Unknown"))) %>%
  tlgsetup(var = "TRT01PN",
           column_metadata_file = system.file("extdata/column_metadata.xlsx", package = "tidytlg"),
           tbltype = "type3")


## ----message=FALSE------------------------------------------------------------
# Generate Results -------------------------------------------------------------------------------------

## Analysis set row
t1 <- adsl %>%
  freq(colvar = "colnbr",
       rowvar = "ITTFL",
       statlist = statlist("n"),
       subset = ITTFL == "Y",
       rowtext = "Analysis set: ITT")

## Univariate summary for AGE
t2 <- adsl %>%
  univar(colvar = "colnbr",
         rowvar = "AGE",
         statlist = statlist(c("N", "MEANSD", "MEDIAN", "RANGE", "IQRANGE")),
         decimal = 0,
         row_header = "Age, years")

## Count (percentages) for SEX
t3 <- adsl %>%
  freq(colvar = "colnbr",
       rowvar = "SEX",
       statlist = statlist(c("N","n (x.x%)")),
       row_header = "Gender")


## -----------------------------------------------------------------------------
# Format Results ---------------------------------------------------------------------------------------

tbl <- bind_table(t1, t2, t3,
       column_metadata_file = system.file("extdata/column_metadata.xlsx", package = "tidytlg"),
       tbltype = "type3")

## -----------------------------------------------------------------------------
knitr::kable(tbl)

## -----------------------------------------------------------------------------
tblid <- "Table01"

gentlg(huxme       = tbl,
       opath       = file.path(working_dir),
       file        = tblid,
       orientation = "landscape",
       title_file = system.file("extdata/titles.xls", package = "tidytlg"))

## -----------------------------------------------------------------------------
gentlg(huxme       = tbl,
       format      = "HTML",
       print.hux = FALSE,
       file        = tblid,
       orientation = "landscape",
       title_file = system.file("extdata/titles.xls", package = "tidytlg"))

## -----------------------------------------------------------------------------
# Prep Environment ---------------------------------------------------------------------------------------
library(dplyr)
library(haven)
library(tidytlg)

adsl <- cdisc_adsl
adae <- cdisc_adae

# Process Data --------------------------------------------------------------------------------------------
adsl <- adsl %>%
  filter(SAFFL == "Y") %>%
  select(USUBJID, SAFFL, TRT01AN, TRT01A)

adae <- adae %>%
  filter(SAFFL == "Y" & TRTEMFL == "Y") %>%
  mutate(BSPT  = paste(AEBODSYS, "[", AEDECOD, "]"),
         SAEFL = if_else(AESER == "Y", "Yes", "No"),
         DTHFL = if_else(AEOUT == "FATAL", "Yes", "No")) %>%
   select(USUBJID, ASTDY, TRTA, BSPT, AETERM, SAEFL, DTHFL)

tbl <- inner_join(adsl, adae, by = "USUBJID") %>%
  arrange(TRT01AN, USUBJID, ASTDY) %>%
  select(TRT01A, USUBJID, ASTDY, TRTA, BSPT, AETERM, SAEFL, DTHFL) %>%
  filter(USUBJID %in% c("01-701-1015", "01-701-1023"))

# Output Results ------------------------------------------------------------------------------------------
gentlg(huxme       = tbl,
       tlf         = "l",
       format      = "HTML",
       print.hux = FALSE,
       orientation = "landscape",
       file        = "Listing01",
       title       = "Listing of Adverse Events",
       idvars      = c("TRT01A", "USUBJID"),
       wcol        = 0.15,
       colheader   = c("Treatment Group",
                       "Subject ID",
                       "Study Day of AE",
                       "Treatment Period",
                       "Body System [Preferred Term]",
                       "Verbatim Term",
                       "Serious",
                       "Fatal"))

## -----------------------------------------------------------------------------
# Prep Environment ---------------------------------------------------------------------------------------
library(dplyr)
library(haven)
library(ggplot2)
library(tidytlg)

# read adsl from PhUSE test data factory
testdata <- "https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/"
adsl <- read_xpt(url(paste0(testdata,"adsl.xpt")))

tblid <- "Graph01"

# Process Data --------------------------------------------------------------------------------------------
adsl <- adsl  %>%
  filter(ITTFL == "Y") %>%
  select(USUBJID, ITTFL, TRT01PN, TRT01P, AGE, SEX, HEIGHTBL, WEIGHTBL) %>%
  mutate(SEX = factor(SEX, levels = c("M", "F"), labels = c("Male", "Female")))

# Generate Results ----------------------------------------------------------------------------------------

plot <- ggplot(data = adsl, aes(x = HEIGHTBL, y = WEIGHTBL)) +
  geom_point() +
  labs(x = "Baseline Height (cm)",
       y = "Baseline Weight (kg)") +
  facet_wrap(~SEX, nrow=1)

# create png file
png(file.path(working_dir, paste0(tblid,".png")), width=2800, height=1300, res=300, type = "cairo")

plot

dev.off()

# Output Results ------------------------------------------------------------------------------------------

gentlg(tlf = "g",
       plotnames = file.path(system.file("extdata", package = "tidytlg"), paste0(tblid,".png")),
       plotwidth = 10,
       plotheight = 5,
       orientation = "landscape",
       opath       = file.path(working_dir),,
       file = tblid,
       title_file = system.file("extdata/titles.xls", package = "tidytlg"))

## ----echo=FALSE, out.width = "750px"------------------------------------------
knitr::include_graphics("graph01.PNG")

## -----------------------------------------------------------------------------
library(dplyr)
library(haven)
library(tidytlg)

# read adsl from PhUSE test data factory
testdata <- "https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/"
adsl <- read_xpt(url(paste0(testdata,"adsl.xpt")))

# Process data
adsl <- adsl %>%
  filter(ITTFL == "Y") %>%
  mutate(SEX = factor(SEX, levels = c("M", "F", "U"), labels = c("Male", "Female", "Unknown")))

# define table metadata
table_metadata <- tibble::tribble(
  ~func,     ~df,   ~rowvar, ~decimal, ~rowtext,     ~row_header, ~statlist,         ~subset,
  "freq",  "adsl",  "ITTFL",     NA, "Analysis set: ITT",     NA, statlist("n"),  "ITTFL == 'Y'",
  "univar", "adsl",   "AGE",      0,         NA, "Age (Years)",           NA,              NA,
  "freq",  "adsl",    "SEX",     NA,         NA, "Gender", statlist(c("N", "n (x.x%)")),   NA
) %>%
  mutate(colvar  = "TRT01PN")

# Generate results
tbl <- generate_results(table_metadata,
                        column_metadata_file = system.file("extdata/column_metadata.xlsx", package = "tidytlg"),
                        tbltype = "type3")

# Output results
tblid <- "Table01"

gentlg(huxme       = tbl,
       format      = "HTML",
       print.hux = FALSE,
       file        = tblid,
       orientation = "landscape",
       title_file = system.file("extdata/titles.xls", package = "tidytlg"))

## ----message=FALSE------------------------------------------------------------
library(dplyr)
library(haven)
library(tidytlg)

# read adsl from PhUSE test data factory
testdata <- "https://github.com/phuse-org/TestDataFactory/raw/main/Updated/TDF_ADaM/"
adsl <- read_xpt(url(paste0(testdata,"adsl.xpt")))

# Process data
adsl <- adsl %>%
  filter(ITTFL == "Y") %>%
  mutate(SEX = factor(SEX, levels = c("M", "F"), labels = c("Male", "Female")))

# define table metadata
table_metadata <- tibble::tribble(
  ~func,     ~df,   ~rowvar, ~decimal, ~rowtext,     ~row_header, ~statlist,         ~subset, ~tablebyvar,
  "univar", "adsl",   "AGE",      0,         NA, "Age (Years)",           NA,              NA, "SEX",
  "freq",  "adsl",    "RACE",     NA,         NA, "Race", statlist(c("N", "n (x.x%)")),   NA, "SEX"
) %>%
  mutate(colvar  = "TRT01PN")

# Generate results
tbl <- generate_results(table_metadata,
                        column_metadata_file = system.file("extdata/column_metadata.xlsx", package = "tidytlg"),
                        tbltype = "type3")

# Output results
tblid <- "Table01"

gentlg(huxme       = tbl,
       format      = "HTML",
       print.hux = FALSE,
       file        = tblid,
       orientation = "landscape",
       title_file = system.file("extdata/titles.xls", package = "tidytlg"))


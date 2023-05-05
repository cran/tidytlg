## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE------------------------------------------------------
library(huxtable)

opath <- "."

df <- tibble::tribble(
  ~Symbol, ~`Textual Description`,  ~Unicode,  
  "\u2190", "Left arrow", "\\u2190", 
  "\u2192", "Right arrow", "\\u2192", 
  "\u2264", "Less-than or equal to", "\\u2264", 
  "\u2265", "Greater-than or equal to", "\\u2265", 
  "\u2260", "Not equal to", "\\u2260", 
  "\u00b1", "Plus-minus sign", "\\u00b1", 
  "\u03b1", "Alpha", "\\u03b1", 
  "\u03b2", "Beta", "\\u03b2", 
  "\u03bc", "Mu", "\\u03bc", 
  "\u00ab", "Non-breaking space", "\\u00ab"
)
df

# quick_rtf(hux(df),
#           file = "./test.rtf")
# 
# 

## ----eval = FALSE-------------------------------------------------------------
#  
#  df <- tibble::tibble(
#    label = c("\u2264", "\u2265"),
#    col1 = c("100", "200")
#  )
#  
#  tidytlg::gentlg(df,
#                  file = "demo")
#  

## ----eval = FALSE-------------------------------------------------------------
#  
#  df <- tibble::tibble(
#    label = c("This is a superscript a{\\super a}",
#              "This is a subscript b{\\sub b}"),
#    col1 = c("100", "200")
#  )
#  
#  tidytlg::gentlg(df,
#                  file = "demo")
#  

## ----eval = FALSE-------------------------------------------------------------
#  
#  df <- tibble::tibble(
#    label = c("This is a superscript a{\\super a}",
#              "This is a subscript b{\\sub b}"),
#    col1 = c("100", "200")
#  )
#  
#  tidytlg::gentlg(df,
#                  file = "demo",
#                  footers = "This is a footnote superscript{\\super a}")
#  

## ----eval = FALSE-------------------------------------------------------------
#  
#  df <- tibble::tibble(
#    label = c("Bodysystem \\\n Preferred Term"),
#    col1 = c("100")
#  )
#  
#  tidytlg::gentlg(df,
#                  file = "demo")
#  
#  

## ----eval = FALSE-------------------------------------------------------------
#  
#  df <- tibble::tibble(
#    label = c("Bodysystem\\\n\\li180Preferred Term"),
#    col1 = c("100")
#  )
#  
#  tidytlg::gentlg(df,
#                  file = "demo")
#  
#  


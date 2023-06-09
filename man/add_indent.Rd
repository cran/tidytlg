% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_indent.R
\name{add_indent}
\alias{add_indent}
\title{Add indentation variable to the results dataframe}
\usage{
add_indent(df)
}
\arguments{
\item{df}{dataframe of results that contains \code{row_type} and \code{label}
and the optional \code{nested_level} and \code{group_level} variables.}
}
\value{
dataframe with the \code{indentme} variable added.
}
\description{
Add the \code{indentme} variable to your results data. This drives the number of
indents for the row label text (e.g. 0, 1, 2, etc.).
}
\details{
The \code{group_level} variable, which is added to the results dataframe by \code{freq()}
and \code{univar()} calls, is needed to define indentation when by variables are
used for summary.

The \code{nested_level} variable, which is added to the results dataframe by
\code{nested_freq()}, is needed to define indentation for each level of nesting.

Both of these are added to the default indentation which is driven by
\code{row_type}.\tabular{lc}{
   row_type \tab default indentation \cr
   TABLE_BY_HEADER \tab 0 \cr
   BY_HEADER[1-9] \tab 0 \cr
   HEADER \tab 0 \cr
   N \tab 1 \cr
   VALUE \tab 2 \cr
   NESTED \tab 0 \cr
}
}
\examples{
df <- tibble::tibble(row_type     =  c("TABLE_BY_HEADER", "HEADER",
       "BY_HEADER1", "N", "VALUE", "COUNTS", "UNIVAR", "NESTED", "NESTED"),
                     nested_level =  c(NA, NA, NA, NA, NA, NA, NA, 1, 2),
                     group_level =  c(0, 0, 0, 0, 0, 0, 0, 0, 0),
                     label        =  c(NA, NA, NA, NA, NA, "N",NA, NA, NA),
                     by           =  c(NA, NA, NA, NA, NA, NA, NA, NA, NA),
                     tableby      =  c(NA, NA, NA, NA, NA, NA, NA, NA, NA))
add_indent(df)
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidytlg-package.R
\docType{package}
\name{tidytlg}
\alias{tidytlg-package}
\alias{tidytlg}
\title{tidytlg: A package for producing tables, listings, and graphs (TLGs) using
tidyverse packages.}
\description{
The tidytlg package provide a set of function allowing you to produce TLGs
using table metadata.
}
\section{tidytlg Options}{


\itemize{ \item{tidytlg.row_type.levels - The values of row_type and their
respective levels. Default: c("TABLE_BY_HEADER", "BY_HEADER1", "BY_HEADER2",
"BY_HEADER3", "BY_HEADER4", "BY_HEADER5", "HEADER", "N", "VALUE", "NESTED")}
\item{tidytlg.fontsize.title - Font size for titles in points. Default: 10}
\item{tidytlg.fontsize.table.footnote - Font size for footnotes in points.
For tables. Default: 9} \item{tidytlg.fontsize.listing.footnote - Font size
for footnotes in points. For listings. Default: 8}
\item{tidytlg.fontsize.graph.footnote - Font size for footnotes in points.
For graphs. Default: 8} \item{tidytlg.fontsize.table - Font size for tables
in points. Default: 9} \item{tidytlg.fontsize.graph - Font size for graphs in
points. Default: 10} \item{tidytlg.fontsize.listing - Font size for listings
in poins. Default: 8} \item{tidytlg.right.padding - Amount of right padding
for cells in points. Default: 1} \item{tidytlg.left.padding - Amount of left
padding for cells in points. Default: 1} \item{tidytlg.stat_labels - Labels
to be used for each summary statistic in the output table.  Will need to have
all available statistics if this option is changed!}
\item{tidytlg.precision.extra - Value to be added on for each summary
statistic when calculating precision.  This will be used to make different
statistics have different precision as needed}
\item{tidytlg.nested_freq.statlist.default - Default statlist object for
nested_freq tables. Default: statlist("n (x.x)")}
\item{tidytlg.univar.statlist.default - Default statlist object for univar
tables. Default: statlist(c("N", "MEANSD", "MEDIAN", "RANGE", "IQRANGE"))}
\item{tidytlg.freq.statlist.default - Default statlist object for freq
tables. Default: statlist("n (x.x)")} \item{tidytlg.stat_labels - A
data.frame controlling how the stats are labeled in a univar table. See
'Default Stat Labels' section for defaults.} \item{tidytlg.denoms.message - A
boolean, should a message print detailing what the denominators are?}
}
}

\section{Default Stat Labels}{
\tabular{ll}{
   \strong{stat} \tab \strong{label} \cr
   N \tab N \cr
   SUM \tab Sum \cr
   MEAN \tab Mean \cr
   GeoMEAN \tab Geometric Mean \cr
   SD \tab Std. Dev. \cr
   SE \tab Std. Error \cr
   GSD \tab Geometric Std. Dev. \cr
   GSE \tab Geometric Std. Error \cr
   CV \tab CV \cr
   MEANSD \tab Mean (SD) \cr
   MEANSE \tab Mean (SE) \cr
   MEDIAN \tab Median \cr
   MIN \tab Minimum \cr
   MAX \tab Maximum \cr
   RANGE \tab Range \cr
   Q1 \tab First quartile \cr
   Q3 \tab Third quartile \cr
   IQRANGE \tab IQ range \cr
   MEDRANGE \tab Median (Range) \cr
   MEDIQRANGE \tab Median (Q1; Q3) \cr
   MEAN_CI \tab Mean (95\% C.I.) \cr
   GeoMEAN_CI \tab Geometric Mean (95\% C.I.) \cr
}
}

\section{Default Precision Extra}{
\tabular{ll}{
   \strong{stat} \tab \strong{extra} \cr
   N \tab 0 \cr
   SUM \tab 0 \cr
   MEAN \tab 1 \cr
   GeoMEAN \tab 1 \cr
   SD \tab 2 \cr
   SE \tab 2 \cr
   GSD \tab 2 \cr
   GSE \tab 2 \cr
   CV \tab 1 \cr
   MEDIAN \tab 1 \cr
   MIN \tab 0 \cr
   MAX \tab 0 \cr
   Q1 \tab 1 \cr
   Q3 \tab 1 \cr
   LCL_MEAN \tab 2 \cr
   UCL_MEAN \tab 2 \cr
   LCL_GeoMEAN \tab 2 \cr
   UCL_GeoMEAN \tab 2 \cr
}
}

\section{Updating Options}{

\itemize{
\item{For a single session, an option can be changed by
\verb{option(<optionToChange> = <NewValue>)}}
\item{To change an option for a single projects across sessions in that
projects, place the options update in the \code{.Rprofile} in that project
directory.}
\item{To change an option for a user across all sessions, place the options
update in the \code{.Rprofile} file in the users home directory.}
\item{To change an option for all users in an R environment, place the
options update in the \code{.Rprofile.site} file in the R home directory.}
}
}

\seealso{
Useful links:
\itemize{
  \item \url{https://pharmaverse.github.io/tidytlg/main/}
  \item \url{https://github.com/pharmaverse/tidytlg}
  \item Report bugs at \url{https://github.com/pharmaverse/tidytlg/issues}
}

}
\author{
\strong{Maintainer}: Konrad Pagacz \email{kpagacz@its.jnj.com}

Authors:
\itemize{
  \item Nicholas Masel \email{nmasel@its.jnj.com}
  \item Steven Haesendonckx \email{shaesen2@its.jnj.com}
  \item Pelagia Alexandra Papadopoulou \email{ppapadop@its.jnj.com}
  \item Sheng-Wei Wang \email{swang69@its.jnj.com}
  \item Eli Miller \email{eli.miller@atorusresearch.com} (\href{https://orcid.org/0000-0002-2127-9456}{ORCID})
  \item Nathan Kosiba \email{nkosiba@its.jnj.com} (\href{https://orcid.org/0000-0001-5359-4234}{ORCID})
  \item Aidan Ceney \email{aceney@its.jnj.com} (\href{https://orcid.org/0000-0001-8313-487X}{ORCID})
}

Other contributors:
\itemize{
  \item Janssen R&D [copyright holder, funder]
  \item David Hugh-Jones (Author of included huxtable library) [copyright holder]
}

}
\keyword{internal}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_results.R
\name{generate_results}
\alias{generate_results}
\title{Generate Results using Table and Column Metadata}
\usage{
generate_results(
  table_metadata,
  column_metadata_file = NULL,
  column_metadata = NULL,
  env = parent.frame(),
  tbltype = NULL,
  add_count = FALSE
)
}
\arguments{
\item{table_metadata}{dataframe containing table metadata (see
?table_metadata for details)}

\item{column_metadata_file}{An excel file with the data for column_metadata.
The file is read in with \code{readxl::read_excel()}. Should not be used with
\code{column_metadata} argument. Results in a dataframe containing the column
metadata that is passed to tlgsetup (see \code{tlgsetup()} for details). If a
column_metadata dataframe is passed in too, this is ignored.}

\item{column_metadata}{A dataframe containing the column metadata. This will
be used in place of \code{column_metadata_file}.}

\item{env}{environment to find dataframe specified in the table metadata
(defaults to parent environment)}

\item{tbltype}{If used, this will be used to subset the \code{column_metadata} based
on the \code{tbltype} column.}

\item{add_count}{Passed to \code{bind_table()} should counts be added for
\code{tablebyvars}?}
}
\value{
dataframe of results
}
\description{
Generate Results using Table and Column Metadata
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/emojis_df.R
\docType{data}
\name{Emojis}
\alias{Emojis}
\title{Emoji Reference Dataframe}
\format{A data frame with 3567 rows and five variables
The variables are as follows:
\describe{
   \item{unicode}{unicode for emoji as string}
   \item{words}{english phrase for emoji}
   \item{emoji}{emoji}
   \item{byte}{byte sequence for emoji}
   \item{nchar}{length of byte sequence}
}}
\source{
The data was sourced from \href{(https://unicode.org/emoji/charts/full-emoji-list.html}{unicode.org}.
}
\usage{
Emojis
}
\description{
A dataframe containing emojis, their unicodes, and a brief text description.
}
\examples{
head(Emojis)
}
\keyword{datasets}

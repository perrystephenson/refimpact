% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ref_get.R
\name{ref_get}
\alias{ref_get}
\title{Call the REF Impact Case Studies API}
\usage{
ref_get(api_method, tag_type = NULL, query = NULL)
}
\arguments{
\item{api_method}{text, the API method you wish to call. Valid methods
are summarised below, and documented on the REF Impact Case Studies website
linked above, as well as in the vignette.}

\item{tag_type}{integer, for ListTagValues method only. This is the ID of the
tag type you wish to retrieve. See example usage below.}

\item{query}{list, search parameters for use with the SearchCaseStudies
method. See example usage below.}
}
\value{
Returns a \code{\link[tibble]{tibble}} with nested data frames. To
  access the nested data frames, subset the tibble using the [[]] syntax. For
  more information, see the vignette.
}
\description{
This function calls the REF Impact Case Studies API, and returns the dataset
as a tibble. See the vignette for more details about how to use this
function.
}
\details{
Details about the API can be found at
\url{http://impact.ref.ac.uk/CaseStudies/APIhelp.aspx}.
}
\section{Valid API methods}{

\itemize{
  \item ListInstitutions (no arguments)
  \item ListTagTypes (no arguments)
  \item ListTagValues (tag_type is a compulsory argument)
  \item ListUnitsOfAssessment (no arguments)
  \item SearchCaseStudies (query is a compulsory argument - see below)
}
}

\section{SearchCaseStudies query argument}{

This argument is used to pass search parameters through to the API. These
parameters are passed as a named list, and you must provide at least one
parameter for this method. There are 5 parameters:
\itemize{
\item ID - Takes a single ID or a vector of IDs. If you use this parameter
you cannot use any of the other 4 parameters.
\item UKPRN (UK Provider Reference Number) - takes a single UKPRN. You can
get a list of valid values using the ListInstitutions method.
\item UoA - This is a code referencing a Unit of Assessment, and you can get
a list of valid values from the ListUnitsOfAssessment method. Takes a single
UoA.
\item tags - This is one or more codes referencing tags from the
ListTagValues method. When multiple tags are provided to the search method,
it will only return rows which contain both tags. To help you discover tags
that you can use here, you can look at the ref_tags dataset (bundled with
this package)
\item phrase - You can search the database using a text query. The query must
conform to Lucene search query syntax.
}
For more information about how to use these parameters, see the vignette.
}

\examples{
\donttest{
institutions <- ref_get("ListInstitutions")
units_of_assessment <- ref_get("ListUnitsOfAssessment")
tag_types <- ref_get("ListTagTypes")
tag_type_5 <- ref_get("ListTagValues", 5L)
ref_get("SearchCaseStudies", query = list(ID     = c(27121,1698)))
ref_get("SearchCaseStudies", query = list(UKPRN  = 10007777))
ref_get("SearchCaseStudies", query = list(UoA    = 5))
ref_get("SearchCaseStudies", query = list(tags   = c(11280, 5085)))
ref_get("SearchCaseStudies", query = list(phrase = "hello"))
ref_get("SearchCaseStudies", query = list(UKPRN  = 10007146, UoA = 3))
}

}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/htmlTable_helpers_tblNo.R
\name{prTblNo}
\alias{prTblNo}
\title{Gets the table counter string}
\usage{
prTblNo(caption = NULL)
}
\arguments{
\item{caption}{The caption if any}
}
\value{
\code{string} Returns a string formatted according to
the table_counter_str and table_counter_roman. The number is
decided by the table_counter variable
}
\description{
Returns the string used for htmlTable to number the different tables.
Uses options \code{table_counter}, \code{table_counter_str},
and \code{table_counter_roman} to produce the final string. You
can set each option by simply calling \code{options()}.
}
\seealso{
Other hidden helper functions for htmlTable: 
\code{\link{prAddCells}()},
\code{\link{prAddEmptySpacerCell}()},
\code{\link{prAddSemicolon2StrEnd}()},
\code{\link{prEscapeHtml}()},
\code{\link{prGetCgroupHeader}()},
\code{\link{prGetRowlabelPos}()},
\code{\link{prGetStyle}()},
\code{\link{prPrepInputMatrixDimensions}()},
\code{\link{prPrepareAlign}()},
\code{\link{prPrepareCgroup}()}
}
\concept{hidden helper functions for htmlTable}
\keyword{internal}

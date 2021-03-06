% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/htmlTable_helpers_prepareAlign.R
\name{prPrepareAlign}
\alias{prPrepareAlign}
\title{Prepares the align to match the columns}
\usage{
prPrepareAlign(align, x, rnames, default_rn = "l")
}
\arguments{
\item{x}{The matrix/data.frame with the data. For the \code{print} and \code{knit_print}
it takes a string of the class \code{htmlTable} as \code{x} argument.}

\item{rnames}{Default row names are generated from \code{\link[base:colnames]{rownames(x)}}. If you
provide \code{FALSE} then it will skip the row names. \emph{Note:} For \code{data.frames}
if you do \code{\link[base:colnames]{rownames(my_dataframe) <- NULL}} it still has
row names. Thus you need to use \code{FALSE} if you want to
supress row names for \code{data.frames}.}

\item{default_rn}{The default rowname alignment. This is an option
as the header uses the same function and there may be differences in
how the alignments should be implemented.}
}
\description{
The alignment may be tricky and this function therefore simplifies
this process by extending/shortening the alignment to match the
correct number of columns.
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
\code{\link{prPrepareCgroup}()},
\code{\link{prTblNo}()}
}
\concept{hidden helper functions for htmlTable}
\keyword{internal}

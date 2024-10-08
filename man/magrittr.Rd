% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/magrittr.R
\name{\%a\%}
\alias{\%a\%}
\title{magrittr - a Forward-Pipe Operator for R}
\usage{
lhs \%a\% rhs
}
\arguments{
\item{lhs}{An artifact that will be used as an argument of \code{rhs} by 
\code{\%a\%} operator.}

\item{rhs}{A function call using \code{lhs} as an argument by
\code{\%a\%} operator.}
}
\description{
An extended pipe operator \link[magrittr]{\%>\%} from magrittr package version 1.0.1.
Enables archiving artifacts with their chaining code - see examples and vignettes.
}
\details{
The extension works as follows, the result of \code{\%a\%} operator is archived together 
with lhs (as an artifact) and rhs (as a Tag). This allows to present a history of
an artifact. This option works only if a default repository is set.
}
\section{Contact}{

 
Bug reports and feature requests can be sent to 
\href{https://github.com/pbiecek/archivist/issues}{https://github.com/pbiecek/archivist/issues}
}

\section{Demonstration}{


This function is well explained on this  blog post.
}

\examples{
\dontrun{

library("dplyr")

## Usage of \%a\% operator without setting default repository
# We will receive special warning
iris \%a\% summary()

## Archiving artifacts with their chaining code
# Creating empty repository
exampleRepoDir <- tempfile()
createLocalRepo( exampleRepoDir, default = TRUE ) # Remember to set repo to default

# Start using \%a\% operator
data("hflights", package = "hflights")
hflights \%a\%
  group_by(Year, Month, DayofMonth) \%a\%
  select(Year:DayofMonth, ArrDelay, DepDelay) \%a\%
  summarise(arr = mean(ArrDelay, na.rm = TRUE),
            dep = mean(DepDelay, na.rm = TRUE)) \%a\%
  filter(arr > 30 | dep > 30)
  
# Let's check how Tags of subsequent artifacts look like
showLocalRepo()
getTagsLocal("a8ce013a8e66df222be278122423dc60", tag = "") #1
getTagsLocal("9d91fe67fd51f3bfdc9db0a596b12b38", tag = "") #2
getTagsLocal("617ded4953ac986524a1c24703363980", tag = "") #3
getTagsLocal("3f1ac0a27485be5d52e1b0a41d165abc", tag = "") #4
getTagsLocal("0cb04315482de73d7f5a1081953236f8", tag = "") #5
getTagsLocal("5629bc43e36d219b613076b17c665eda", tag = "") #6

# Deleting existing repository
deleteLocalRepo(exampleRepoDir, deleteRoot = TRUE)
rm(exampleRepoDir) 
}
}
\seealso{
Other archivist: 
\code{\link{Repository}},
\code{\link{Tags}},
\code{\link{addHooksToPrint}()},
\code{\link{addTagsRepo}()},
\code{\link{aformat}()},
\code{\link{ahistory}()},
\code{\link{alink}()},
\code{\link{aoptions}()},
\code{\link{archivistPackage}},
\code{\link{aread}()},
\code{\link{areadLocal}()},
\code{\link{asearch}()},
\code{\link{asearchLocal}()},
\code{\link{asession}()},
\code{\link{atrace}()},
\code{\link{cache}()},
\code{\link{copyLocalRepo}()},
\code{\link{createLocalRepo}()},
\code{\link{createMDGallery}()},
\code{\link{deleteLocalRepo}()},
\code{\link{getRemoteHook}()},
\code{\link{getTagsLocal}()},
\code{\link{loadFromLocalRepo}()},
\code{\link{md5hash}},
\code{\link{removeTagsRepo}()},
\code{\link{restoreLibs}()},
\code{\link{rmFromLocalRepo}()},
\code{\link{saveToLocalRepo}()},
\code{\link{searchInLocalRepo}()},
\code{\link{setLocalRepo}()},
\code{\link{shinySearchInLocalRepo}()},
\code{\link{showLocalRepo}()},
\code{\link{splitTagsLocal}()},
\code{\link{summaryLocalRepo}()},
\code{\link{zipLocalRepo}()}
}
\concept{archivist}

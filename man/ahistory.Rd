% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ahistory.R
\name{ahistory}
\alias{ahistory}
\title{Show Artifact's History}
\usage{
ahistory(
  artifact = NULL,
  md5hash = NULL,
  repoDir = aoptions("repoDir"),
  format = "regular",
  alink = FALSE,
  ...
)
}
\arguments{
\item{artifact}{An artifact which history is supposed to be reconstructed.
It will be converted  into md5hash.}

\item{md5hash}{If \code{artifact} is not specified then \code{md5hash} is used.}

\item{repoDir}{A character denoting an existing directory in which an artifact will be saved.}

\item{format}{A character denoting whether to print history in either a \code{"regular"} (default) way or like in a \code{"kable"} function.
See Notes.}

\item{alink}{Whether to provide hooks to objects like in \link{alink}. See examples.}

\item{...}{Further parameters passed to \link{alink} function. Used when \code{format = "kable"} and \code{alink = TRUE}.}
}
\value{
A data frame with two columns - names of calls and md5hashes of partial results.
}
\description{
\code{ahistory} extracts artifact's history and creates a data frame with  
history of calls and md5hashes of partial results. The overloaded 
\code{print.ahistory} function prints this history in a concise way. The overloaded
\code{print.ahistoryKable} function prints this history in the same way as \link[knitr]{kable}.
When \code{alink=TRUE} one can create history table/kable with hooks to partial results (artifacts) as in the \link{alink} function.
}
\details{
All artifacts created with \link[archivist]{\%a\%} operator are archivised with 
detailed information  about it's source (both call and md5hash of the input).
The function \code{ahistory} reads all artifacts that 
precede \code{artifact} and create a description of the input flow. 
The generic \code{print.ahistory} function plots the history in a human readable  way.
}
\note{
There are provided functions (\code{print.ahistory} and \code{print.ahistoryKable}) to print the artifact's history. 
History can be printed either in a \code{regular} way which is friendly for the console output or in a \code{kable} format which 
prints the artifact's history in a way \link[knitr]{kable} function would. This is convenient when one prints history
in \code{.Rmd} files using \link[rmarkdown]{rmarkdown}.

Moreover when user passes \code{format = 'kable'} and \code{alink = TRUE} then one can use links for remote Repository. 
Then md5hashes are taken from Local Repository, so user has to specify \code{repo}, \code{user} and \code{repoDir} even though 
they are set globally, because \code{repo} is a substring of \code{repoDir} and during evaluation of \code{...} R treats \code{repo} as \code{repoDir}.
}
\section{Contact}{

 
Bug reports and feature requests can be sent to 
\href{https://github.com/pbiecek/archivist/issues}{https://github.com/pbiecek/archivist/issues}
}

\section{Demonstration}{

 
This function is well explained on this  blog post.
}

\examples{

createLocalRepo("ahistory_check", default = TRUE)
library(dplyr)
iris \%a\%
filter(Sepal.Length < 6) \%a\%
 lm(Petal.Length~Species, data=.) \%a\%
 summary() -> artifact
 
ahistory(artifact)
ahistory(artifact, format = "kable")  
print(ahistory(artifact, format = "kable"), format = "latex")
ahistory(artifact, format = "kable", alink = TRUE, repoDir = "ahistory_check",
repo = "repo", user = "user")


repoDir <- file.path(getwd(), "ahistory_check")
deleteLocalRepo(repoDir, deleteRoot = TRUE)
aoptions('repoDir', NULL, unset = TRUE)

}
\references{
Biecek P and Kosinski M (2017). "archivist: An R Package for Managing,
Recording and Restoring Data Analysis Results." _Journal of Statistical
Software_, *82*(11), pp. 1-28. doi: 10.18637/jss.v082.i11 (URL:
http://doi.org/10.18637/jss.v082.i11).
URL https://github.com/pbiecek/archivist
}
\seealso{
Other archivist: 
\code{\link{Repository}},
\code{\link{Tags}},
\code{\link{\%a\%}()},
\code{\link{addHooksToPrint}()},
\code{\link{addTagsRepo}()},
\code{\link{aformat}()},
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
\author{
Przemyslaw Biecek, \email{przemyslaw.biecek@gmail.com}

Marcin Kosinski, \email{m.p.kosinski@gmail.com}
}
\concept{archivist}

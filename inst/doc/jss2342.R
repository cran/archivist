## ----warning=FALSE,results='hide', echo=FALSE-----------------------
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)

## ----warning=FALSE,results='hide'-----------------------------------
library("archivist")

## -------------------------------------------------------------------
models <- asearch("pbiecek/graphGallery", patterns = "class:lm")
modelsBIC <- sapply(models, BIC)
sort(modelsBIC)

## -------------------------------------------------------------------
repo <- "arepo"
createLocalRepo(repoDir = repo, default = TRUE)

## -------------------------------------------------------------------
repo <- "arepo"
deleteLocalRepo(repoDir = repo)

## -------------------------------------------------------------------
repo <- "arepo"
createLocalRepo(repoDir = repo, default = TRUE)
copyRemoteRepo(repoTo = repo, 
    md5hashes = "7f3453331910e3f321ef97d87adb5bad",
    user = "pbiecek", repo = "graphGallery", repoType = "github")

## -------------------------------------------------------------------
showLocalRepo(repoDir = repo, method = "tags")

## -------------------------------------------------------------------
summaryLocalRepo(repoDir = 
    system.file("graphGallery", package = "archivist")) 

## -------------------------------------------------------------------
setRemoteRepo(user = "pbiecek", repo = "graphGallery", repoType = "github")
setLocalRepo(repoDir = 
    system.file("graphGallery", package = "archivist"))

## -------------------------------------------------------------------
data("iris")
saveToRepo(iris)

## -------------------------------------------------------------------
aoptions("repoType", "github")

## ----warning=FALSE--------------------------------------------------
library("ggplot2")
repo <- "arepo"
pl <- qplot(Sepal.Length, Petal.Length, data = iris)
saveToLocalRepo(pl, repoDir = repo)

## -------------------------------------------------------------------
showLocalRepo(repoDir = repo, "tags")

## -------------------------------------------------------------------
asession("7f3453331910e3f321ef97d87adb5bad")

## ----echo=FALSE, warning=FALSE--------------------------------------
suppressPackageStartupMessages(library(dplyr))

## -------------------------------------------------------------------
library("archivist")
createLocalRepo("arepo", default = TRUE)
library("dplyr")
iris %a%
    dplyr::filter(Sepal.Length < 6) %a%
    lm(Petal.Length~Species, data=.) %a%
    summary() -> tmp

## -------------------------------------------------------------------
ahistory(tmp)
ahistory(md5hash = "050e41ec3bc40b3004bc6bdd356acae7")

## ----fig.width=6,fig.height=4---------------------------------------
loadFromRemoteRepo("7f3453331910e3f321ef97d87adb5bad",
    repo = "graphGallery", user = "pbiecek", value = TRUE)
loadFromLocalRepo("7f34533", 
    system.file("graphGallery", package = "archivist"), value = TRUE)

## ----eval=FALSE-----------------------------------------------------
#  archivist::aread("pbiecek/graphGallery/7f3453331910e3f321ef97d87adb5bad")

## ----echo=FALSE-----------------------------------------------------
library("archivist")
setLocalRepo(system.file("graphGallery", package = "archivist"))
aread("7f3453331910e3f321ef97d87adb5bad")

## -------------------------------------------------------------------
setLocalRepo(system.file("graphGallery", package = "archivist"))
model <- aread("2a6e492cb6982f230e48cf46023e2e4f")
digest::digest(model)

## ----eval=FALSE-----------------------------------------------------
#  rmFromLocalRepo("7f3453331910e3f321ef97d87adb5bad", repoDir = repo)

## -------------------------------------------------------------------
obj2rm <- searchInLocalRepo(list(dateFrom = "2010-01-01", 
    dateTo = Sys.Date()-30), repoDir = repo)
rmFromLocalRepo(obj2rm, repoDir = repo, many = TRUE)

## -------------------------------------------------------------------
searchInLocalRepo(pattern = "class:gg", 
    repoDir = system.file("graphGallery", package = "archivist"))

## -------------------------------------------------------------------
searchInLocalRepo(pattern = list(dateFrom = "2016-01-01",
    dateTo = "2016-02-07"), 
    repoDir = system.file("graphGallery", package = "archivist"))

## -------------------------------------------------------------------
searchInLocalRepo(pattern=c("class:gg", "labelx:Sepal.Length"),
    repoDir = system.file("graphGallery", package = "archivist"))

## -------------------------------------------------------------------
setLocalRepo(system.file("graphGallery", package = "archivist"))
models <- asearch(patterns = c("class:lm", "coefname:Sepal.Length"))

## -------------------------------------------------------------------
models <- asearch("pbiecek/graphGallery",  
    patterns = c("class:lm", "coefname:Sepal.Length"))
lapply(models, coef)

## -------------------------------------------------------------------
plots <- asearch(patterns = c("class:gg", "labelx:Sepal.Length"))
length(plots)

## ----eval=FALSE-----------------------------------------------------
#  library("gridExtra")
#  do.call(grid.arrange, plots)

## ----eval=FALSE-----------------------------------------------------
#  arepo <- system.file("graphGallery", package = "archivist")
#  shinySearchInLocalRepo(arepo)
#  

## -------------------------------------------------------------------
library("archivist")
createLocalRepo("allModels", default = TRUE)
atrace("lm", "z")
lm(Sepal.Length ~ Sepal.Width, data=iris)
sapply(asearch("class:lm"), BIC)

## -------------------------------------------------------------------
addHooksToPrint(class=c("ggplot", "data.frame"),
                  repoDir = "arepo", 
                  repo = "Eseje", user = "pbiecek", subdir = "arepo")

## ----eval=FALSE-----------------------------------------------------
#  createMDGallery("arepo/readme.md",
#             repo = "Eseje", user = "pbiecek", subdir = "arepo",
#             addMiniature = TRUE, addTags = TRUE)
#  

## -------------------------------------------------------------------
asession("pbiecek/graphGallery/arepo/600bda83cb840947976bd1ce3a11879d")

## ----eval=FALSE-----------------------------------------------------
#  restoreLibs("pbiecek/graphGallery/arepo/600bda83cb840947976bd1ce3a11879d")

## ----eval=FALSE-----------------------------------------------------
#  aread("pbiecek/graphGallery/arepo/600bda83cb840947976bd1ce3a11879d")


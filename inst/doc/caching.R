## ---- eval=FALSE--------------------------------------------------------------
#  getMaxDistribution <- function(
#  	D = rnorm,
#  	N = 10,
#  	R = 1000000) {
#  	res <- replicate(R, max(D(N)))
#    summary(res)
#  }
#  
#  system.time(getMaxDistribution(rnorm, 10))

## ---- eval=FALSE--------------------------------------------------------------
#     user  system elapsed
#    5.477   0.035   5.511

## ---- eval=FALSE--------------------------------------------------------------
#  system.time(getMaxDistribution(rexp, 20))

## ---- eval=FALSE--------------------------------------------------------------
#     user  system elapsed
#    5.156   0.008   5.164

## ---- eval=FALSE--------------------------------------------------------------
#  system.time(getMaxDistribution(rnorm, 10))

## ---- eval=FALSE--------------------------------------------------------------
#     user  system elapsed
#    4.845   0.001   4.844

## ---- eval=FALSE--------------------------------------------------------------
#  library(archivist)
#  cacheRepo <- tempfile()
#  createLocalRepo(cacheRepo)

## ---- eval=FALSE--------------------------------------------------------------
#  Directory /tmp/Rtmp45GZsm/file65d3676f9387 did not exist. Forced to create a new directory.

## ---- eval=FALSE--------------------------------------------------------------
#  system.time(cache(cacheRepo, getMaxDistribution, rnorm, 10))

## ---- eval=FALSE--------------------------------------------------------------
#     user  system elapsed
#    4.738   0.004   4.740

## ---- eval=FALSE--------------------------------------------------------------
#  system.time(cache(cacheRepo, getMaxDistribution, rexp, 10))

## ---- eval=FALSE--------------------------------------------------------------
#     user  system elapsed
#    4.950   0.008   4.955

## ---- eval=FALSE--------------------------------------------------------------
#  system.time(cache(cacheRepo, getMaxDistribution, rnorm, 10))

## ---- eval=FALSE--------------------------------------------------------------
#     user  system elapsed
#    0.003   0.000   0.003


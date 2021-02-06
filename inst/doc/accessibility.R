## ---- eval=FALSE--------------------------------------------------------------
#  library(archivist)
#  library(ggplot2)
#  # objects of class ggplot for which the session_info was archvied
#  md5plots <- searchInRemoteRepo(
#  	pattern = c("class:ggplot", "session_info"),
#  	intersect = TRUE, repo = "graphGallery",
#  	user = "pbiecek", fixed = FALSE
#  	)
#  
#  plots <- lapply(md5plots, function(pl) {
#  	loadFromRemoteRepo(
#  		md5hash = pl,
#  		repo = "graphGallery",
#  		user = "pbiecek",
#  		value = TRUE
#  		) +
#  		ggtitle(pl)
#  })
#  	
#  library(gridExtra)
#  do.call(
#  	"grid.arrange",
#  	c(plots, ncol=round(sqrt(length(md5plots))))
#  	)

## ---- eval=FALSE--------------------------------------------------------------
#  summaryRemoteRepo(
#  	repo = "graphGallery",
#  	user = "pbiecek"
#  	)

## ---- eval=FALSE--------------------------------------------------------------
#  Number of archived artifacts in Repository:  53
#  Number of archived datasets in Repository:  24
#  Number of various classes archived in Repository:
#                Number
#  ggplot            6
#  tbl_df            3
#  grouped_df        3
#  area              1
#  proto             1
#  lm                9
#  numeric           2
#  list              3
#  summary.lm        4
#  data.frame       16
#  matrix            1
#  igraph            1
#  communities       1
#  character         1
#  table             1
#  intsvy.mean       2
#  intsvy.table      2
#  intsvy.reg        1
#  gg                2
#  Saves per day in Repository:
#              Saves
#  2014-08-21     4
#  2014-09-03    11
#  2015-06-22     4
#  2015-06-24    16
#  2015-06-25    17
#  2015-06-27     1
#  2015-06-28     4
#  2015-06-29     4
#  2015-06-30     4
#  2015-07-01     4
#  2015-07-09     4
#  2015-07-10     5
#  2015-07-15     1
#  2015-07-16     3
#  2015-07-20     2
#  2015-08-12     3
#  2015-08-25     3
#  2015-08-29     1
#  2015-09-12     4
#  2015-09-14     4
#  2015-09-20     2
#  2015-09-22     1
#  2015-10-08     2
#  2015-10-12     1
#  2015-11-15     3
#  2015-11-27     4
#  2015-11-30    11
#  2016-02-07     2
#  2016-02-09     3
#  2016-03-04     4


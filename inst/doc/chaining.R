## ---- eval=FALSE---------------------------------------------------------
#  library(archivist)
#  exampleRepoDir <- getwd()
#  createLocalRepo(exampleRepoDir, default = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  # example 1
#  library(dplyr)
#  
#  data("hflights", package = "hflights")
#  hflights %a%
#     group_by(Year, Month, DayofMonth) %a%
#     select(Year:DayofMonth, ArrDelay, DepDelay) %a%
#     summarise(
#        arr = mean(ArrDelay, na.rm = TRUE),
#        dep = mean(DepDelay, na.rm = TRUE)
#     ) %a%
#     filter(arr > 30 | dep > 30) -> example1

## ---- eval=FALSE---------------------------------------------------------
#  # example 2
#  library(Lahman)
#  
#  # Traditional R code
#  players <- group_by(Batting, playerID)
#  games <- summarise(players, total = sum(G))
#  head(arrange(games, desc(total)), 5)

## ---- eval=FALSE---------------------------------------------------------
#  Source: local data frame [5 x 2]
#  
#     playerID total
#        (chr) (int)
#  1  rosepe01  3562
#  2 yastrca01  3308
#  3 aaronha01  3298
#  4 henderi01  3081
#  5  cobbty01  3035

## ---- eval=FALSE---------------------------------------------------------
#  # Corresponding chaining code
#  Batting %a%
#     group_by(playerID) %a%
#     summarise(total = sum(G)) %a%
#     arrange(desc(total)) %a%
#     head(5) %a%
#     asave( repoDir = exampleRepoDir )

## ---- eval=FALSE---------------------------------------------------------
#  [1] "b5ba48251904ce231c382594cdc75bb2"

## ---- eval=FALSE---------------------------------------------------------
#  setLocalRepo( exampleRepoDir )

## ---- eval=FALSE---------------------------------------------------------
#  # example 3
#  aread('MarcinKosinski/Museum/3374db20ecaf2fa0d070d') -> crime.by.state
#  crime.by.state %a%
#     filter(State=="New York", Year==2005) %a%
#     arrange(desc(Count)) %a%
#     select(Type.of.Crime, Count) %a%
#     mutate(Proportion=Count/sum(Count)) %a%
#     asave( exampleRepoDir, value = TRUE) %a%
#     group_by(Type.of.Crime) %a%
#     summarise(num.types = n(), counts = sum(Count)) %a%
#     asave( )

## ---- eval=FALSE---------------------------------------------------------
#  [1] "9a3dd58b75558273c53a441ec823b219"

## ---- eval=FALSE---------------------------------------------------------
#  # example 4
#  library(ggplot2)
#  
#  diamonds %a%
#     group_by(cut, clarity, color) %a%
#     summarize(
#        meancarat = mean(carat, na.rm = TRUE),
#        ndiamonds = length(carat)
#     ) %a%
#     head( 10) %a%
#     asave(userTags = c("tags", "operations on diamonds"))

## ---- eval=FALSE---------------------------------------------------------
#  [1] "33576ab6aa88e5aedb4887aeffd84fa9"

## ---- eval=FALSE---------------------------------------------------------
#  # results = 'asis'
#  hash2 <- searchInLocalRepo( pattern = "operations on diamonds" )
#  ahistory(hash2, format = "kable")


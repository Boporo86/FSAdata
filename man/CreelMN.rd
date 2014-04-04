\docType{data}
\name{CreelMN}
\alias{CreelMN}
\title{Results of a large number of creel surveys in Minnestoa lakes.}
\format{A data frame of 14550 observations on the following 2 variables:
\describe{
\item{species}{species of fish that was targeted.}
\item{harvest}{number of fish of that species harvested by one angler.}
}}
\source{
From tables in Cook et al. 2001.  Creel limits in
Minnesota: A proposal for change.  Fisheries 26:19-26.
}
\description{
The species targeted, number of fish harvested, and number
of individuals harvesting that number of that species of
fish from a large number of surveys on Minnesota Lakes,
1980-1996.
}
\examples{
data(CreelMN)
str(CreelMN)
head(CreelMN)
levels(CreelMN$species)
wae <- Subset(CreelMN,species=="WAE")
( waetbl <- table(wae$harvest) )
( waeptbl <- prop.table(waetbl)*100 )
( waercum <- rcumsum(waeptbl) )
op <- par(mfrow=c(1,2),mar=c(3.5,3.5,0.5,0.5),mgp=c(2,0.5,0))
barplot(waeptbl,xlab="Number of Walleye Harvested",ylab="Percentage of Individuals")
barplot(waercum,xlab="Minimum Number of Walleye Harvested",ylab="Percentage of Individuals")
par(op)
( ttlwae <- sum(wae$harvest) )
wae$svd5 <- wae$harvest-5             # Used to determine the number of fish
table(wae$svd5)                       #   saved if limit was reduced to 5.
( svd5 <- sum(wae$svd5[wae$svd5>0]) ) #   Only sum positive numbers (i.e., saved)
round(svd5/ttlwae*100,1)              # Show as a percentage

wae$svd1 <- wae$harvest-1             # same but if reduced to 1 bag.
table(wae$svd1)
( svd1 <- sum(wae$svd1[wae$svd1>0]) )
round(svd1/ttlwae*100,1)
}
\keyword{datasets}


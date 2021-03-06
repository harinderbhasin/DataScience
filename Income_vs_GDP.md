# Income vs. GDP
Harry Bhasin  
July 4, 2016  
# Introduction
The purpose of this module is to analyze the Income ranking of all the countries given their Gross Domestic Products (GDP). The data is publically available and collected from world bank organization.

From this set of data my observation is that countries with higher GDP, very few of those rank in lower income. Although the data collected for income is not exactly from the same year for the data collected for GDP, howver, there are enough observations amoung approximately 200 countries to provide my observation.

# Specification
The data available publically is not is consumable format to analyze for our purpopses. A considerable amount of data cleaning, tidying, and merging across different sets is required. In order to accomplish our goal, first we clean, merge, and tidy the data. And then use algorithms to analyze the income rankings by demonstrating using plots.

The flow of the code is:
(i)   downloand the essential data files.
(ii)  cleanup the data by ensuring the countries being observed are present in both GDP and Income ranking data.
(iii) create quantiles for the cleaned observation to categorize for summary
(iV)  plot the data to visulize different income rankings with respect to GDP.


```r
library(ggplot2)
# Create and set a working directory
dir.create("C:/Harry/Data_Science/SMU/MSDS_6306_4033/CaseStudy1", recursive = TRUE)
```

```
## Warning in dir.create("C:/Harry/Data_Science/SMU/MSDS_6306_4033/
## CaseStudy1", : 'C:\Harry\Data_Science\SMU\MSDS_6306_4033\CaseStudy1'
## already exists
```

```r
setwd("C:/Harry/Data_Science/SMU/MSDS_6306_4033/CaseStudy1")
mygdpfile <- NULL
myincomefile <- NULL
myincome1file <- NULL
```
# Function
  * Download function
  * Arguments:
  *    URL to the file
  *    Destination file name to be created
  *    Data Frame
  * Return:
  *    Data in memory from the downloaded file
#

```r
dwnld <- function (urlpathlink, thefilename) {
  dwnldfile <- urlpathlink
  download.file(dwnldfile, destfile = thefilename)
  return(read.csv(thefilename, stringsAsFactors = FALSE, header = FALSE))
}
```
# Function
  * Cleanup Income data file
  * Arguments:
  *    The data that needs to be cleaned up
  * Return:
  *    Cleaned Data in memory
#

```r
cleanincome <- function (infile) {
  # trim the unwanted rows and columns
  return(infile[2:235,1:3])
}
```
# Function
  * Cleanup GDP data file
  * Arguments:
  *    The data that needs to be cleaned up
  * Return:
  *    Cleaned Data in memory
#

```r
cleangdpdata <- function(infile) {
  # trim the unwanted rows and columns
  outfile <- infile[6:195,1:5]
  # convert the data into integers
  outfile$V2 <- as.integer(outfile$V2)
  # remove the commas from the GDP numbers
  outfile$V5 <- gsub(",", "", outfile$V5)
  # convert those number into numeric values
  outfile$V5 <- as.numeric(outfile$V5)
  # assign the year 2012 to all the rows since the data is from 2012
  outfile$V3 <- 2012
  names(outfile)
  str(outfile)
  return(outfile)
}
```
# Download the GDP data file

```r
mygdpfile <- dwnld("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "GDP.csv")
```
# Download the Income data file

```r
myincomefile <- dwnld("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "Income.csv")
```

# Cleanup the GDP data

```r
mygdp1file <- cleangdpdata(mygdpfile)
```

```
## 'data.frame':	190 obs. of  5 variables:
##  $ V1: chr  "USA" "CHN" "JPN" "DEU" ...
##  $ V2: int  1 2 3 4 5 6 7 8 9 10 ...
##  $ V3: num  2012 2012 2012 2012 2012 ...
##  $ V4: chr  "United States" "China" "Japan" "Germany" ...
##  $ V5: num  16244600 8227103 5959718 3428131 2612878 ...
```
# Cleanup the Income data

```r
myincome1file <- cleanincome(myincomefile)
```
# Merge data by country so that for each country there is a GDP ranking and # income level
# 189 count IDs matched

```r
d1 <- matrix(ncol=4, nrow=length(mygdp1file$V1))
for(i in 1:length(mygdp1file$V1)) {
  x <- grep(mygdp1file$V1[i], myincome1file$V1)
  if (!is.null(x) & length(x))
      d1[i, ] <- cbind(mygdp1file$V1[i], mygdp1file$V5[i], myincome1file$V1[x], myincome1file$V3[x])
}
d1 <- d1[apply(d1, 1, function(y) !all(is.na(y))),]
myd1 <- data.frame(d1)
write.csv(myd1, file="myd1.csv")
```
# Sort the data frame in ascending order by GDP rank (so United States is last).

```r
smygdp1file <- mygdp1file[order(mygdp1file$V5), ]
### 13th entry/country
smygdp1file[13,]
```

```
##      V1  V2   V3                  V4  V5
## 184 KNA 178 2012 St. Kitts and Nevis 767
```

```r
# 184 KNA 178 2012            St. Kitts and Nevis 767
```
# What are the average GDP rankings for the "High income: OECD" and "High income: nonOECD" groups? 

```r
total <- 0
nonoe <- 0
nonoecnt <- 0
oe <- 0
oecnt <- 0
#
for(i in 1:length(d1[,1])) {
  if(d1[i,4] == "High income: nonOECD") {
    nonoe = nonoe + as.numeric(d1[i,2])
    nonoecnt = nonoecnt + 1
  }
  else if(d1[i,4] == "High income: OECD") {
    oe = oe + as.numeric(d1[i,2])
    oecnt = oecnt + 1
  }
}
avgnonoe <- nonoe/nonoecnt
avgoe <- oe/oecnt
cat("Average GDP rankings for the High income: OECD ", avgoe)
```

```
## Average GDP rankings for the High income: OECD  1483917
```

```r
cat("Average GDP rankings for the High income: nonOECD ", avgnonoe)
```

```
## Average GDP rankings for the High income: nonOECD  104349.8
```
# Plot the GDP for all the countries with colored income ranking

```r
myd1$X4 <- factor(myd1$X4,levels=c("High income: nonOECD","High income: OECD",
                                   "Upper middle income","Lower middle income",
                                   "Low income"),
                  labels=c("High income: nonOECD","High income: OECD",
                                  "Upper middle income","Lower middle income",
                                  "Low income"))
qplot(myd1$X2, myd1$X4, data=myd1, geom=c("boxplot", "jitter"),
      fill=myd1$X4, main="GDP by Income levels",
      xlab="GDP", ylab="Income Levels") 
```

![](Income_vs_GDP_files/figure-html/unnamed-chunk-12-1.png)<!-- -->
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group.
# How many countries are Lower middle income but among the 38 nations with highest GDP?

```r
da <- quantile(as.numeric(d1[,2]))
# da
perctable <- matrix(ncol=2, nrow=length(da))
for(i in 1:length(da)) {
  perctable[i, 1] <- da[i]
}
perc1 <- 0
perc2 <- 0
perc3 <- 0
perc4 <- 0
perc5 <- 0
lowmidinc <- 0
for(i in 1:length(myd1$X2)) {
  val <- as.numeric(d1[i,2])
  incomelevel <- d1[i,4]
  if (val <= da[1]) {
    perc1 = perc1 + 1
    perctable[1, 2] <- perc1
  }
  else if (val > da[1] & val <= da[2]) {
    perc2 = perc2 + 1
    perctable[2, 2] <- perc2
  }
  else if (val > da[2] & val <= da[3]) {
    perc3 = perc3 + 1
    perctable[3, 2] <- perc3
  }
  else if (val > da[3] & val <= da[4]) {
    perc4 = perc4 + 1
    perctable[4, 2] <- perc4
  }
  else if (val > da[4] & val <= da[5]) {
    perc5 = perc5 + 1
    perctable[5, 2] <- perc5
  }
  if (i <= 38 & incomelevel == "Lower middle income") {
      lowmidinc = lowmidinc + 1
  }
}
cat("Table of different quantiles: ")
```

```
## Table of different quantiles:
```

```r
print(perctable)
```

```
##          [,1] [,2]
## [1,]       40    1
## [2,]     6972   47
## [3,]    28242   47
## [4,]   205789   47
## [5,] 16244600   47
```

```r
cat("Countries with Highest GDP and lower middle income ", lowmidinc)
```

```
## Countries with Highest GDP and lower middle income  5
```

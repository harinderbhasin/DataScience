library(plyr)
require(gdata)
#
bk <- read.xls("c:/Harry/Data_Science/SMU/MSDS_6306_4033/NYCHousingSales/Data/rollingsales_manhattan.xls", pattern="BOROUGH")
#
head(bk)
#
summary(bk)
#
bk$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]", "", bk$SALE.PRICE))
count(is.na(bk$SALE.PRICE.N))
names(bk) <- tolower(names(bk))
#
bk$gross.sqft <- as.numeric(gsub("[^[:digit:]]", "", bk$gross.square.feet))
bk$land.sqft <- as.numeric(gsub("[^[:digit:]]", "", bk$land.square.feet))
bk$sale.date <- as.Date(bk$sale.date)
bk$year.built <- as.numeric(as.character(bk$year.built))
#
#
attach(bk)
#
hist(sale.price.n)
hist(sale.price.n[sale.price.n>0])
hist(sale.price.n[sale.price.n==0])
#
detach(bk)
#
bk.sale <- bk[bk$sale.price.n!=0,]
plot(bk.sale$gross.sqft, bk.sale$sale.price.n)
plot(log(bk.sale$gross.sqft), log(bk.sale$sale.price.n))
#
#
bk.homes <- bk.sale[which(grepl("FAMILY", bk.sale$building.class.category)),]
plot(log(bk.homes$gross.sqft), log(bk.homes$sale.price.n))
#bk.homes[which(bk.homes$sale.price.n < 100000),]
#    [order(bk.homes[which(bk.homes$sale.price.n<100000),],
#           bk.homes$sale.price.n),]
#
bk.homes$outliers <- (log(bk.homes$sale.price.n)<=5) + 0
bk.homes <- bk.homes[which(bk.homes$outliers==0),]
#
plot(log(bk.homes$gross.sqft),log(bk.homes$sale.price.n))

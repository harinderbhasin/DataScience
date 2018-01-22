# HomeWork8
Harry Bhasin  
July 13, 2016  

```r
setwd("C:/Harry/Data_Science/SMU/MSDS_6306_4033/Hwrk8")
lwvdata <- read.csv("LWV_Data.csv", header = TRUE)
```

# According to the provided information only a small portion of the population had been sampled. As shown in the histogram for the sampled data, very small portion of the entire population represented those for sampling. Therefore, the results had been disappointing.

# A yet another sampling would be to group the samples by the (i) zip, (ii) Category, and by (iii) year. With this set of samples majority of the population will be represented and provide more randomness. Please see the histogram for zip and year.


```r
summary(lwvdata)
```

```
##    VOTED2014      Young.Hispanic.Status   ID.Number       Voter.Status
##  Min.   :0.0000   non_y_h    : 73380    Min.   :    186   A:531735    
##  1st Qu.:0.0000   non_y_non_h:295050    1st Qu.:3294584               
##  Median :0.0000   y_h        : 41739    Median :3857611               
##  Mean   :0.1468   y_non_h    :121566    Mean   :3520479               
##  3rd Qu.:0.0000                         3rd Qu.:4060678               
##  Max.   :1.0000                         Max.   :4216592               
##                                                                       
##  Voted.11.2012    Voted.Gen..Elec..09.2010 Voted.Gen..Elec..07.2008
##  Min.   :0.0000   Min.   :0.00000          Min.   :0.0000          
##  1st Qu.:0.0000   1st Qu.:0.00000          1st Qu.:0.0000          
##  Median :0.0000   Median :0.00000          Median :0.0000          
##  Mean   :0.2506   Mean   :0.01028          Mean   :0.1259          
##  3rd Qu.:1.0000   3rd Qu.:0.00000          3rd Qu.:0.0000          
##  Max.   :1.0000   Max.   :1.00000          Max.   :1.0000          
##                                                                    
##  Number.General.Elections Hispanic.Surname  Young.Voter    
##  Min.   :0.0000           Min.   :0.0000   Min.   :0.0000  
##  1st Qu.:0.0000           1st Qu.:0.0000   1st Qu.:0.0000  
##  Median :0.0000           Median :0.0000   Median :0.0000  
##  Mean   :0.3868           Mean   :0.2165   Mean   :0.3071  
##  3rd Qu.:1.0000           3rd Qu.:0.0000   3rd Qu.:1.0000  
##  Max.   :1.0000           Max.   :1.0000   Max.   :1.0000  
##                                                            
##  Eligible.2012    Eligible.2010    Eligible.2008    Young.in.2012   
##  Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000  
##  1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000  
##  Median :1.0000   Median :1.0000   Median :0.0000   Median :0.0000  
##  Mean   :0.7438   Mean   :0.5098   Mean   :0.4382   Mean   :0.3825  
##  3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000  
##  Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.0000  
##                                                                     
##  Young.in.2010    Young.in.2008               Voter.Category  
##  Min.   :0.0000   Min.   :0.0000   Old Hispanic      : 73380  
##  1st Qu.:0.0000   1st Qu.:0.0000   Old Not Hispanic  :295050  
##  Median :0.0000   Median :0.0000   Young Hispanic    : 41739  
##  Mean   :0.4281   Mean   :0.4685   Young Not Hispanic:121566  
##  3rd Qu.:1.0000   3rd Qu.:1.0000                              
##  Max.   :1.0000   Max.   :1.0000                              
##                                                               
##                   type              ID             control      
##                     :507735   Min.   :    186   Min.   :0.0     
##  Non_y_h_CONTROL    :  2000   1st Qu.:3294584   1st Qu.:0.0     
##  Non_y_h_FLYER      :  2000   Median :3857611   Median :0.0     
##  Non_y_h_POST       :  2000   Mean   :3520479   Mean   :0.3     
##  Non_y_non_h_CONTROL:  2000   3rd Qu.:4060678   3rd Qu.:1.0     
##  Non_y_non_h_FLYER  :  2000   Max.   :4216592   Max.   :1.0     
##  (Other)            : 14000                     NA's   :507735  
##       post            flyer           LOWPROP             city       
##  Min.   :0.0      Min.   :0.0      Min.   :1   DALLAS       :260590  
##  1st Qu.:0.0      1st Qu.:0.0      1st Qu.:1   GARLAND      : 49921  
##  Median :0.0      Median :0.0      Median :1   IRVING       : 43054  
##  Mean   :0.3      Mean   :0.3      Mean   :1   MESQUITE     : 31642  
##  3rd Qu.:1.0      3rd Qu.:1.0      3rd Qu.:1   GRAND PRAIRIE: 25632  
##  Max.   :1.0      Max.   :1.0      Max.   :1   RICHARDSON   : 17203  
##  NA's   :507735   NA's   :507735               (Other)      :103693  
##       zip        U_S__CONGRESS       byear     
##  Min.   :75001   Min.   : 5.00   Min.   :1898  
##  1st Qu.:75062   1st Qu.:24.00   1st Qu.:1961  
##  Median :75201   Median :30.00   Median :1976  
##  Mean   :75152   Mean   :26.98   Mean   :1972  
##  3rd Qu.:75224   3rd Qu.:32.00   3rd Qu.:1987  
##  Max.   :75287   Max.   :33.00   Max.   :1996  
##                                  NA's   :1
```

```r
#
par(mfrow = c(2, 3))
# Samples taken
hist(lwvdata$post)
hist(lwvdata$flyer)
hist(lwvdata$control)

# Proposed samples
hist(lwvdata$zip)
hist(lwvdata$byear)
```

![](lwv_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

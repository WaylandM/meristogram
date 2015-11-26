#Meristogram Command Line Interface

##1. Read source code
To read files over https we need to install the RCurl package:
```r
install.packages("RCurl", dependencies = TRUE)
```
The latest version of the meristogram code can be sourced directly from github:
```r
eval(expr = parse(text = getURL("https://raw.githubusercontent.com/WaylandM/meristogram/master/CLI/meristogram.R", ssl.verifypeer=FALSE) ))
```
Alternatively, if you have a local copy of meristogram.R you can read it using source, *e.g.*:
```r
source("~/meristogram.R")
```
If you want to see the functions you have imported, run the list objects command:
```r
ls()
```

The file meristogram.R provides four functions: 
* createMeristogram
* minHksPerRow
* minMovAvgInterval
* plotMeristogram


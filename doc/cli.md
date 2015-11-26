#Meristogram Command Line Interface

##1. Read source code
To read files over https we need to install the RCurl package:
```r
install.packages("RCurl", dependencies = TRUE)
```
The latest version of the meristogram code can be sourced directly from the meristogram repository on github:
```r
eval(expr = parse(text = getURL("https://raw.githubusercontent.com/WaylandM/meristogram/master/CLI/meristogram.R", ssl.verifypeer=FALSE) ))
```
Alternatively, if you have a local copy of meristogram.R you can read it using **source**, *e.g.*:
```r
source("~/meristogram.R")
```

The file meristogram.R provides four functions: 
* createMeristogram
* minHksPerRow
* minMovAvgInterval
* plotMeristogram

##2. Read hook measurement data
Hook measurement data must be stored in a comma separated value (CSV) file with four columns: specimen, hook, length and base (see [How to measure hooks](https://github.com/WaylandM/meristogram/blob/master/doc/How%20to%20measure%20hooks.md)).

To read in an example data file from the meristogram repository on github, use:
```r
brayi_male_raw <- read.csv(text=getURL("https://raw.githubusercontent.com/WaylandM/meristogram/master/data/Echinorhynchus_brayi_male.csv"))
```

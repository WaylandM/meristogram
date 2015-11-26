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
* **createMeristogram** - generate meristogram from data.frame of hook measurement data.
* **minHksPerRow** - takes a data.frame of hook measurements as its argument and reports the size of the smallest row of hooks.
* **minMovAvgInterval** - takes an integer as its argument and calculates the minimum moving average interval such that every specimens is represented in each interval.
* **plotMeristogram** - plots the generated meristogram.

##2. Read hook measurement data
Hook measurement data must be stored in a comma separated value (CSV) file with four columns: specimen, hook, length and base (see [How to measure hooks](https://github.com/WaylandM/meristogram/blob/master/doc/How%20to%20measure%20hooks.md)).

To read in an example data file from the meristogram repository on github, use:
```r
brayi_male_raw <- read.csv(text=getURL("https://raw.githubusercontent.com/WaylandM/meristogram/master/data/Echinorhynchus_brayi_male.csv"))
```
Alternatively, a locally stored hook measurement file can be read using:
```r
brayi_male_raw <- read.csv("Echinorhynchus_brayi_male.csv")
```

##3. Generate and plot meristogram


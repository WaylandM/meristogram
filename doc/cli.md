#Meristogram Command Line Interface (CLI)

##Functions available
The script [meristogram.R](https://github.com/WaylandM/meristogram/blob/master/CLI/meristogram.R) provides four functions: **minHksPerRow**, **minMovAvgInterval**, **createMeristogram** and **plotMeristogram**.

####minHksPerRow
**minHksPerRow** takes as its argument a data.frame of hook measurements and returns the length of the shortest row of hooks in the collection.

####minMovAvgInterval
**minMovAvgInterval** takes as its argument the length of the shortest row of hooks in the collection (see **minHksPerRow** above). It returns the minimum size for the moving average interval, such that each proboscis is represented in all moving average intervals. 

The minimum moving average interval is calculated using the formula: *ceiling(100/(x+1))*, where *x* is the length of the shortest row of hooks in the collection.

####createMeristogram

####plotMeristogram


##How to use the CLI
###1. Read source code
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



###2. Read hook measurement data
Hook measurement data must be stored in a comma separated value (CSV) file with four columns: specimen, hook, length and base (see [How to measure hooks](https://github.com/WaylandM/meristogram/blob/master/doc/How%20to%20measure%20hooks.md)).

To read in an example data file from the meristogram repository on github, use:
```r
brayi_male_raw <- read.csv(text=getURL("https://raw.githubusercontent.com/WaylandM/meristogram/master/data/Echinorhynchus_brayi_male.csv"))
```
Alternatively, a locally stored hook measurement file can be read using:
```r
brayi_male_raw <- read.csv("Echinorhynchus_brayi_male.csv")
```

###3. Generate and plot meristogram


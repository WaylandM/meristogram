# Meristogram Command Line Interface (CLI)

## Functions available
The script [meristogram.R](https://github.com/WaylandM/meristogram/blob/master/CLI/meristogram.R) provides four functions: **minHksPerRow**, **minMovAvgInterval**, **createMeristogram** and **plotMeristogram**.

### minHksPerRow
**minHksPerRow** takes as its argument a data.frame of hook measurements and returns the length of the shortest row of hooks in the collection.

### minMovAvgInterval
**minMovAvgInterval** takes as its argument the length of the shortest row of hooks in the collection (see **minHksPerRow** above). It returns the minimum size for the moving average interval, such that each proboscis is represented in all moving average segments. 

The minimum moving average interval is calculated using the formula: *ceiling(100/(x+1))*, where *x* is the length of the shortest row of hooks in the collection.

### createMeristogram
Arguments: 
* **hookMeasurements** - data.frame of hook measurements
* **movAvgSeg** - moving average segment size (defaults to minimum moving average interval applicable to data-set)
* **lerp** - logical. If TRUE (default) apply linear interpolation. Linear interpolation attempts to generate hook metrics (length, base, area and ratio) for hook positions 0:100. 
* **rm.lerp.na** - logical. It may not be possible to generate hook metrics for all hook positions in the range 0:100, in which case NAs will be generated. If rm.lerp.na is TRUE (default), NAs will be removed from the output.

**createMeristogram** returns a data.frame containing the meristogram data

### plotMeristogram
This function requires just one argument, a meristogram data.frame generated by the **createMeristogram** function. Optionally, additional arguments can be passed to methods, such as graphical parameters. **plotMeristogram** produces a plot of all four hook parameters (length, base, area and ratio) against position in longitudinal row.


## How to use the CLI
### 1. Read source code
To read files over https we need to install the RCurl package:
```r
install.packages("RCurl", dependencies = TRUE)
```
The latest version of the meristogram code can be sourced directly from the meristogram repository on github:
```r
library(RCurl)
eval(expr = parse(text = getURL("https://raw.githubusercontent.com/WaylandM/meristogram/master/CLI/meristogram.R", ssl.verifypeer=FALSE) ))
```
Alternatively, if you have a local copy of meristogram.R you can read it using **source**, *e.g.*:
```r
source("~/meristogram.R")
```

### 2. Read hook measurement data
Hook measurement data must be stored in a comma separated value (CSV) file with four columns: specimen, hook, length and base (see [How to measure hooks](https://github.com/WaylandM/meristogram/blob/master/doc/How%20to%20measure%20hooks.md)).

To read in an example data file from the meristogram repository on github, use:
```r
brayi_male_raw <- read.csv(text=getURL("https://raw.githubusercontent.com/WaylandM/meristogram/master/data/Echinorhynchus_brayi_male.csv"))
```
Alternatively, a locally stored hook measurement file can be read using:
```r
brayi_male_raw <- read.csv("Echinorhynchus_brayi_male.csv")
```

If you want to know how many specimens are represented in your data.frame of hook measurements, run:
```r
length(unique(brayi_male_raw$specimen))
```

To calculate the smallest moving average interval applicable to your data set, run:
```r
minMovAvgInterval(minHksPerRow(brayi_male_raw))
```

### 3. Generate and plot meristogram
To create a meristogram with default settings:
```r
brayi_male_meristogram <- createMeristogram(brayi_male_raw)
```
The meristogram will be created and the size of the moving average segment printed to the console.

The meristogram can then be plotted:
```r
plotMeristogram(brayi_male_meristogram)
```
<img src="https://raw.githubusercontent.com/WaylandM/meristogram/master/images/meristogram_plot.png" width="550" alt="Meristogram plot with title">


Optionally, graphical parameters can be passed to **plotMeristogram**. For example, to add a title:
```r
plotMeristogram(brayi_male_meristogram, main="Meristogram for Echinorhynchus brayi")
```
<img src="https://raw.githubusercontent.com/WaylandM/meristogram/master/images/meristogram_plot_with_title.png" width="550" alt="Meristogram plot with title">

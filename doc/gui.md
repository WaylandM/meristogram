#Using the Meristogram Graphical User Interface (GUI)

##Required software
To run the meristogram GUI you will need to install [R](http://www.r-project.org/) and the [Shiny](http://shiny.rstudio.com/) web application framework. 

[R](http://www.r-project.org/) can be downloaded from http://www.r-project.org/. Once you have installed R, you can install Shiny by executing the following instruction on the R command line:
```
install.packages("shiny", dependencies=TRUE)
```

##Launching the Meristogram GUI
Run the following command in R to launch the application:
```
shiny::runGitHub(repo="meristogram", username="waylandm", subdir="gui")
```

The following page will open in your web browser:
<br>
<img src="https://raw.githubusercontent.com/WaylandM/meristogram/master/images/meristogram_gui_start.png" align="right" width="600" alt="Meristogram GUI before data loaded">
<br>
##Loading hook measurement data
Click on the **Choose File** button to select a file of hook measurements. Hook measurement files must be comma separated value (CSV) format with the following four columns: specimen, hook, length and base.

* **specimen** - unique identifier for the specimen
* **hook** - numerical position of hook in longitudinal row as counted from the distal end of the proboscis
* **length** - length of hook blade
* **base** - width of hook base

Example data files can be found in this directory:
https://github.com/WaylandM/meristogram/tree/master/data



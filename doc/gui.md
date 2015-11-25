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


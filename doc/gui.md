#Using the Meristogram Graphical User Interface (GUI)

##Required software
To run the meristogram GUI you will need to install R http://www.r-project.org/ and the [Shiny](http://shiny.rstudio.com/) web application framework. 

###
```
install.packages("shiny", dependencies=TRUE)
```

##Launching the Meristogram GUI
Run the following command in R to launch the application:
```
shiny::runGitHub(repo="Meristogram", username="waylandm", subdir="GUI")
```

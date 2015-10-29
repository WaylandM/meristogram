# non-OO version of meristogram


minHksPerRow <- function(x)
{
  if(!is.vector(x))
    stop("x must be a vector")
  if(!is.numeric(x))
    stop("x must be numeric")
  currMin = max(x)
  for (i in length(x):2)
    if(x[i]<x[i-1])
      if(x[i-1]<currMin)
        currMin = x[i-1]
  return(currMin)
}



minMovAvgInterval <- function(x)
{
  return(ceiling(100/(x+1)))
}
  


   

createMeristogram <- function(hookMeasurements, movAvgSeg, lerp=T)
{
  if(!is.data.frame(hookMeasurements))
    stop("hookMeasurements must be a data.frame")
  if(!identical(names(hookMeasurements), c("specimen", "hook", "length", "base")))
    stop("hookMeasurements must be a data.frame with four columns: specimen, hook, length and base")
  minMovAvgSeg <- ceiling(100/(minHksPerRow(hookMeasurements$hook)+1))
  if(missing(movAvgSeg))
    movAvgSeg <- minMovAvgSeg
  if(movAvgSeg < minMovAvgSeg)
    stop(paste("Requested moving average segment too small. For this set of hooks the minimum value is: ", minMovAvgSeg, sep=""))
  area <- hookMeasurements$length * hookMeasurements$base/2
  ratio <- hookMeasurements$base * 100/hookMeasurements$length
  hookMeasurements <- cbind(hookMeasurements, area, ratio)
  stdHooks <- as.data.frame(cbind(as.character(hookMeasurements$specimen), NA, NA, NA, NA, NA))
  names(stdHooks) <- c("specimen", "position", "length", "base", "area", "ratio")
  stdHooks$position <- as.numeric(stdHooks$position)
  stdHooks$length <- as.numeric(stdHooks$length)
  stdHooks$base <- as.numeric(stdHooks$base)
  stdHooks$area <- as.numeric(stdHooks$area)
  stdHooks$ratio <- as.numeric(stdHooks$ratio)
  specimens <- unique(hookMeasurements$specimen)
  for (s in specimens)
  {
    sIndices <- which(hookMeasurements$specimen==s)
    nPlusOne <- max(hookMeasurements[sIndices,]$hook)+1 # number of hooks per row + corrective factor of 1
    maxL <- max(hookMeasurements[sIndices,]$length)
    maxB <- max(hookMeasurements[sIndices,]$base)
    maxA <- max(hookMeasurements[sIndices,]$area)
    maxR <- max(hookMeasurements[sIndices,]$ratio)
    for (i in sIndices)
    {
      stdHooks$position[i] <- hookMeasurements$hook[i] * 100 / nPlusOne
      stdHooks$length[i] <- hookMeasurements$length[i] * 100 / maxL
      stdHooks$base[i] <- hookMeasurements$base[i] * 100 / maxB
      stdHooks$area[i] <- hookMeasurements$area[i] * 100 / maxA
      stdHooks$ratio[i] <- hookMeasurements$ratio[i] * 100 / maxR
    }
  }
  
  lowerBound <- 0:(100-movAvgSeg)
  
  meristogram <- lapply(lowerBound, function(x)
  {
    segIdx <- which(stdHooks$position >= x & stdHooks$position <= x+movAvgSeg)
    return(c(mean(stdHooks$position[segIdx]), 
             mean(stdHooks$length[segIdx]), 
             mean(stdHooks$base[segIdx]),
             mean(stdHooks$area[segIdx]),
             mean(stdHooks$ratio[segIdx])))
  })
  
  meristogram <- unlist(meristogram)
  meristogram <- as.data.frame(matrix(meristogram, ncol=5, byrow=T))
  names(meristogram) <- c("position", "length", "base", "area", "ratio")
  meristogram$length <- meristogram$length/max(meristogram$length) * 100
  meristogram$base <- meristogram$base/max(meristogram$base) * 100
  meristogram$area <- meristogram$area/max(meristogram$area) * 100
  meristogram$ratio <- meristogram$ratio/max(meristogram$ratio) * 100
  meristogram <- unique(meristogram) # remove duplicates resulting from same sets of hooks being averaged
  
  if(lerp==T)
  {
    l <- approx(meristogram$position, meristogram$length, xout=0:100)
    b <- approx(meristogram$position, meristogram$base, xout=0:100)
    a <- approx(meristogram$position, meristogram$area, xout=0:100)
    r <- approx(meristogram$position, meristogram$ratio, xout=0:100)
    meristogram <- as.data.frame(cbind(l$x, l$y, b$y, a$y, r$y))
    names(meristogram) <- c("position", "length", "base", "area", "ratio")
    meristogram <- meristogram[!is.na(meristogram$length),]
  }
  cat(paste("Meristogram created with a moving average segment of: ", movAvgSeg, "\n"))
  return(meristogram)
}

plotMeristogram <- function(meristogram, ...)
{
  plot(meristogram$position, meristogram$length, pch="L", col="#E41A1C", xlab="% Position", ylab="% Max Value", ylim=c(min(meristogram[,c(2:5)]),100), ...)
  points(meristogram$position, meristogram$base, pch="B", col="#377EB8", ...)
  points(meristogram$position, meristogram$area, pch="A", col="#4DAF4A", ...)
  points(meristogram$position, meristogram$ratio, pch="R", col="#984EA3", ...)
}

# function to standardize hook metrics - position and relative size

# function to perform summarize collection and generate meristogram

# two separate functions to easier to make fast implementation in shiny app and also to allow easy experimentation with loess, etc.



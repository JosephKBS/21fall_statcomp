# Week 7

# ---------------------------------
# 1. moving average
# ---------------------------------
moving_average <- function(x,y,k,na.rm=T){
  #reorder the data by "x"
  ord <- order(x) 
  x <- x[ord]
  y <- y[ord] 
  #establish the number of evaluation points from the data itself.
  n <- length(x)
  # loop to create a moving window. Calculate median inside
  moving_average <- rep(NA, n) 
  for (i in 1:n) {
    if (i - k < 1) {
      lower <- 1
    } else {
      lower <- i - k #
    }
    upper <- min(n, i + k) 
    moving_average[i] <- mean(y[lower:upper], na.rm = na.rm)
  }
  return(list(x=x,y=moving_average))
}

# ---------------------------------
# 2. moving average with boxcar
# ---------------------------------
moving_average <- function(x,y,frac=0.1,n=100,na.rm=T){
  # compute the range of x and build a grid of n eval points (take from boxcar density)
  rng <- range(x)
  gridLength <- diff(rng)
  boxcarLength <- frac*gridLength
  x.grid <- seq(rng[1],rng[2],length=n)
 
  # loop to create a moving window. Calculate mean inside
  movingAverage <- rep(NA, n) #placeholder for results of the mean calls
  for (i in 1:n) {
    #define a vector of `selected` points centered at x.grid[i] with width boxcarLength:
    ###selPoints <-  ... 
    selPoints <- x>=x.grid[i]-boxcarLength/2 & x <= x.grid[i]+boxcarLength/2
    # calculate and assign mean of y[selPoints]:
    ###movingAverage[i] <- ... #remember to average the y associated with x.
  }
  return(list(x=x.grid,y=movingAverage))
}

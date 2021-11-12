# Week 9

# ---------------------------------
# 1. argmin
# ---------------------------------

# Example: 
f(x) = x + 10
list <- c(10,11, 12)

min( f( c(10, 11, 12) )  ) 

argmin(f( c(10,11, 12) ) )

# ---------------------------------
# 2. grid search
# ---------------------------------

calculate.rss <- function(betas, x, y) {
  sum((y - betas[1] - betas[2] * x)^2)
}

beta.from   <- -10
beta.to     <- 10
beta.n.grid <- 500
beta_0 <- seq(beta.from, beta.to, length.out = beta.n.grid)
beta_1 <- seq(beta.from, beta.to, length.out = beta.n.grid)

beta_0.grid <- rep(beta_0, times = beta.n.grid)
beta_1.grid <- rep(beta_1, each  = beta.n.grid)
beta.grid   <- cbind(beta_0.grid, beta_1.grid)

rss <- apply(beta.grid, 1, calculate.rss, x = x, y = y)
min.index <- which.min(rss)
beta.grid[min.index,]

# ---------------------------------
# 3. optim
# ---------------------------------
# calculating RSS function
calculate.rss <- function(betas, x, y) {
  sum((y - betas[1] - betas[2] * x)^2)
}

# optim function
fit.ols <- optim(par = c(0, 0), 
                 fn = calculate.rss, 
                 x = x, 
                 y = y)

# check the result
fit.ols

# ---------------------------------
# 3. egg holder function (optimization)
# ---------------------------------

# Results of fit.ols
egg_funct2<- function(x){ 
  -(x[2]+47)*sin(sqrt(abs(x[2]+(x[1]/2)+47)))-x[1]*sin(sqrt(abs(x[1]-(x[2]+47))))
}

# define the function
f.egghold <- function(x) { f.x <- egg_funct2(x)
  return(f.x)
}

# optimize (minimize) the function using SANN method
out.egghold <- optim(c(500,400), 
                     f.egghold, 
                     method = "SANN")



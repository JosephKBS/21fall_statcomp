############  Week 4 exercise:find my NYC apartment #########

### 0. import data
df <- read.csv("find_my_apartment.csv")


### 1. create density plots of all rent
plot(density(df$rent))


### 2-1. preconditions: 
### first, create a column computing actual rent (actual rent =rent + utility + wifi)

# simple way
df$actual <- df$rent + df$utility + df$wifi

# using for loop
df$actual <- NA     # creating empty column called "actual"
for (i in nrow(df)){
  df$actual[i] <- df$rent[i] + df$utility[i] + df$wifi[i]
}



### 2-2. preconditions
### - There is a 50% reduction in utility in Greenwich Village
### - 50% reduction in wifi in Kips Bay if rent > 2500$
for (i in nrow(df) ){
  if(df$area[i]=="Greenwich_v"){
    df$rent[i] <- df$rent[i]*0.5
  }
  else if ( df$area[i]=="Kips_bay" & df$rent[i] > 2500 ){
    df$wifi[i] <- df$wifi[i]*0.5
  }
}



### 2-2 Using for loop and conditionals to find..
  # (a) Rent < 2400($)
  # (b) Room type is either fine
  # (c) I prefer to have washer
  # (d) No higher than 5th floor
  # (e) Grocery in 10 minutes
  # (f) Café near 10 minutes



# 1. one line code (Basic R code version)
df[ which( df$rent < 2400 & df$floor < 5 & df$grocery<10 & df$cafe < 10) , ]

# 2. tidyverse version
# install.packages('tidyverse') # if you did not install tidyverse
library(tidyverse)
df %>% filter(rent<2400, floor<5, grocery<10, cafe<10)

# 3. for loop version
df$mark <- 0
for (i in 1:nrow(df)){
  if(df$rent[i]<2400 & df$floor[i]<5 & df$grocery<10 & df$cafe<10){
    df$mark[i] <- 1
  }
}
df[ df$mark==1, ]

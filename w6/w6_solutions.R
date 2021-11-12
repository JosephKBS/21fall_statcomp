###### Week 6 exercise solutions #####

# ---------------------------------
# 0. import data
# ---------------------------------
df <- read.csv( "w6_data_consulting.csv" )


# ---------------------------------
# task1 : correct the country's name
# ---------------------------------
USA_list <- c("United States","US","America", "The US", "United States of America")
russia_list <- c("Russia", "USSR", "RUSSIA", "Russian Federation")

for (i in 1:nrow(df)){
  if (df$student_country[i] %in% USA_list){
    df$student_country[i] <- "USA"
  } else if (df$student_country[i] %in% russia_list){
    df$student_country[i] <- "Russia"
  }
}

# ---------------------------------
# task 2: create column that calculate mean of all items
# compute mean using apply
# ---------------------------------
df$average <- apply( df[,3:12], MARGIN = 1, FUN = mean )


# ---------------------------------
# task 3: new info indicates that there should be a multiplier
  # If country is in Europe, 50% increase. (but not more than 2sd range)
  # If couunry is North America, 35% increase (but not more than 2sd range)
  # If country is South America, 15% decrease (but not lower than 2sd range)
  # If country is in Africa, 30% decrease (but not lower than 2sd range)
  # calculate average expense per student by country using tapply
# ---------------------------------
europe_list <- c("France","Latvia","UK","Portugal","Estonia","Croatia","Albania", "Malta","Monaco", "Slovenia","Sweden" ," Ukraine","Norway", "Ireland","Hungary", "Belgium", "Austria","Germany","Italy", "Andorra")
N_america_list <- c("USA","Canada")
africa_list <- c("Uganda","Nigeria","Tanzania","Benin", "Djibouti", "Libya","Senegal", "Tonga", "Tuvalu", "Zambia", "Liberia", "Ghana", "Egypt","Angola")
S_america_list <- c("Ecuador","Argentina","Haiti", "Venezuela", "Panama","Dominica", "Cuba", "Brazil","Chile","Bolivia", "Colombia","Grenada")


for (i in 1:nrow(df)){
  eu_mean <- mean( df$average[df$student_country %in% europe_list] )
  eu_up_bound <- eu_mean + 2 * sd( df$average[df$student_country %in% europe_list])
  
  n_america_mean <- mean( df$average[df$student_country %in% N_america_list] )
  n_america_bound <-n_america_mean + 2 * sd( df$average[df$student_country %in% N_america_list])
  
  africa_mean <- mean( df$average[df$student_country %in% africa_list] )
  africa_bound <-africa_mean - 2 * sd( df$average[df$student_country %in% africa_list])
  
  s_america_mean <- mean( df$average[df$student_country %in% S_america_list] )
  s_america_bound <-s_america_mean - 2 * sd( df$average[df$student_country %in% S_america_list])
  
 if(df$student_country[i] %in% europe_list){
   df$average[i] <- min(eu_up_bound, df$average[i]*1.5 )
  } else if (df$student_country[i] %in% N_america_list) {
  df$average[i] <- min(n_america_bound, df$average[i]*1.35 )
  } else if (df$student_country[i] %in% africa_list) {
  df$average[i] <- max(africa_bound, df$average[i]*0.85 )
  } else if (df$student_country[i] %in% S_america_list ){
    df$average[i] <- max(s_america_bound, df$average[i]*0.7 )
  }
}



# ---------------------------------
# task 4: calculate average expense per student by country using tapply
# ---------------------------------

df$region <- NA
for (i in 1:nrow(df)){
  if( df$student_country[i] %in% europe_list ){
    df$region[i] <- "Europe"
  } else if (df$student_country[i] %in% N_america_list ){
    df$region[i] <- "North_America"
  } else if (df$student_country[i] %in% S_america_list ){
    df$region[i] <- "South_America"
  } else if (df$student_country[i] %in% africa_list ){
    df$region[i] <- "Africa"
  } else
    df$region[i] <- "etc"
}

tapply(df$average, INDEX = df$student_country, FUN=mean )


# ---------------------------------
# task 5: calculate MEDIAN expense per student by REGION
# ---------------------------------
df$country_exp <- df$student_count * df$average


# ---------------------------------
# task 6:  create new column to compute total expense per country
# ---------------------------------
tapply(df$country_exp, INDEX = df$region, FUN=sum)

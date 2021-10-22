###### Week 6 exercise #####
# Apply family

# ---------------------------------
# 0. import data
# ---------------------------------
df <- read.csv( )

# ---------------------------------
# task1 : correct the country's name
# ---------------------------------
USA_list <- c("United States","US","America", "The US", "United States of America")
russia_list <- c("Russia", "USSR", "RUSSIA", "Russian Federation")



# ---------------------------------
# task 2: create column that calculate mean of all items
# compute mean using apply
# ---------------------------------
df$average <-


# ---------------------------------
# task 3: new info indicates that there should be a multiplier
  # If country is in Europe, 50% increase. (but not more than 2sd range)
  # If couunry is North America, 35% increase (but not more than 2sd range)
  # If country is South America, 15% decrease (but not lower than 2sd range)
  # If country is in Africa, 30% decrease (but not lower than 2sd range)
# ---------------------------------
europe_list <- c("France","Latvia","UK","Portugal","Estonia","Croatia","Albania", "Malta","Monaco", "Slovenia","Sweden" ," Ukraine","Norway", "Ireland","Hungary", "Belgium", "Austria","Germany","Italy", "Andorra")
N_america_list <- c("USA","Canada")
africa_list <- c("Uganda","Nigeria","Tanzania","Benin", "Djibouti", "Libya","Senegal", "Tonga", "Tuvalu", "Zambia", "Liberia", "Ghana", "Egypt","Angola")
S_america_list <- c("Ecuador","Argentina","Haiti", "Venezuela", "Panama","Dominica", "Cuba", "Brazil","Chile","Bolivia", "Colombia","Grenada")


# ---------------------------------
# task 4: calculate average expense per student by country using tapply
# ---------------------------------
tapply( )


# ---------------------------------
# task 5: calculate MEDIAN expense per student by REGION
# ---------------------------------
df$country_exp <-


# ---------------------------------
# task 6:  create new column to compute total expense per country
# ---------------------------------
tapply(df$country_exp,  )




# Week 10 exercises

# ---------------------------------
# 1. finding "Lea"
# Exercise source: https://discdown.org/rprogramming/loops.html
# ---------------------------------

first_name <- c("Lea",     "Sabine", "Mario", "Lea", "Peter",   "Max")
last_name  <- c("Schmidt", "Gross",  "Super", "Kah", "Steiner", "Muster")

# Looping over index/position:
for (i in seq_along(first_name)) {
    # Check if first_name[i] is Lea. If so, print.
    if (first_name[i] == "Lea") {
        print(paste("Found:", first_name[i], last_name[i]))
    }
}

# Tidyverse approach
df <- data.frame(first_name, last_name)
df %>% filter(first_name == "Lea")

# Another method using subsetting
df <- data.frame(first_name, last_name)
idx <- first_name
df[idx, ]


# ---------------------------------
# 2. Calculating function
# ---------------------------------
# function
calculate_funct <- function(x) {
        ifelse(x < 0, x^4 + 4*x^2 - 17*x, 
               ifelse(x <= 3, x+10,
                      -x^2 + 2*x - 10))
    }
# random x values
random_x <- seq(-2, 3, len=10)

# plot
plot(random_x, calculate_funct(random_x), type="l")

# ---------------------------------
# 3. Matrix calculation
# ---------------------------------
matrix_funct <- function(mat) {
    # if x>10 or x <0, then x= 0
    mat[mat > 10 | mat < 0] <- 0 * mat[mat > 10 | mat < 0]
    # if x is even number, then x = x^3
    mat[mat%%2 == 1] <-  mat[mat%%2 == 1]^3
    # if x is odd number, then x= x*2
    mat[mat%%2 != 1] <-  mat[mat%%2 == 1]^2
    # print
    mat 
}

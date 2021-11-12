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
    if (      ) {
        print(paste(   ))
    }
}

# ---------------------------------
# 2. Calculating function
# ---------------------------------
# function
calculate_funct <- function(x) {


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
    mat[        ] <- 0 * mat[      ]
    # if x is even number, then x = x^3
 
    # if x is odd number, then x= x*2
 
    # print
    mat 
}

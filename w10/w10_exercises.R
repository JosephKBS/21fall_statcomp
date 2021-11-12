# Week 10 exercises



first_name <- c("Lea",     "Sabine", "Mario", "Lea", "Peter",   "Max")
last_name  <- c("Schmidt", "Gross",  "Super", "Kah", "Steiner", "Muster")

# Looping over index/position:
for (i in seq_along(first_name)) {
    # Check if first_name[i] is Lea. If so, print.
    if (first_name[i] == "Lea") {
        print(paste("Found:", first_name[i], last_name[i]))
    }
}

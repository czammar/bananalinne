# Types of variables

# Boolen
TRUE
FALSE

# String
"hola caracola"
"Bananita"

# Integers
451

# Float number
9.999999992354235243534252435234

## Basic aritmetic

# An addition
15 + 5 

# A subtraction
15 - 5 

# A multiplication
13 * 5

# A division
(15 + 5) / 2 

# Exponentiation
5^3

# Modulo
28%%4

# Comparisions

## Is equal?
2 + 2 == 5 
2 + 2 == 4 

## Is greater?
1 < 100
5 < 0

# Logical Operators
(2 + 2 == 5 ) & (2 + 2 == 4) # Check if both are true
(2 + 2 == 5 ) | (2 + 2 == 4) # Check if at least one is true

## Variables and aritmetic

# Assign the value 400 to x
x <- 400

# Print out the value of the variable x
x

# Assign a value to the variables my_apples and my_oranges
my_apples <- 5
my_oranges<-6

# Add these two variables together
my_apples + my_oranges

# Create the variable my_fruit
my_fruit <- my_apples + my_oranges

## Different 

# Change my_numeric to customized value
my_numeric <- 25.5

# Change my_character to be "universe"
my_character <- "some text"

# Change my_logical to be FALSE
my_logical <- TRUE


## Vectors 

numeric_vector <- c(33, 10, 49) # numeric
other_numeric_vector <- c(5, 9, -40) # numeric
character_vector <- c("a", "b", "c") # string
boolean_vector <- c(TRUE, FALSE, TRUE) # boolean_vector

## Some aritmetic with vectors
numeric_vector + other_numeric_vector
numeric_vector - other_numeric_vector
3*numeric_vector
numeric_vector %*% other_numeric_vector

## Selecting entries of a vector
numeric_vector[1]
numeric_vector[3]
numeric_vector[4] # Does not exist

## We can define ranges of numbers
1:10

## Lists

list(5,7,0,101,2,41)

# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Construct list with these different elements:
my_list <- list(my_vector, my_matrix, my_df)

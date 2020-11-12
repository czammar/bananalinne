# Try to load a dummy package
library("tidyverse") # we must have an error

# Install a dummy package
install.packages("tidyverse")

# Load the package
library("tidyverse")

# Allow us to use a function from package
tidyverse_packages() # What it does?

# A fancy and use form to use tools from a library
tidyverse::tidyverse_packages()
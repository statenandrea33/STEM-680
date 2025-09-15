######################
### W4: Code along ###
######################

# Install packages
## We have to first install packages before we can load them (with install.packages() then library())
## shortcut: Ctrl + Enter/Cmd + Return

install.packages("tidyverse")
library(tidyverse)

view(mtcars)

ggplot(data = mtcars, aes(x = mpg, y = wt)) +
  geom_point(aes(color = cyl)) +
  labs(
    title = "MPG vs. Weight",
    x = "Miles per Gallon",
    y = "Weight (in 1000s of lbs)",
    color = "Number of Cylinders"
  )

##### Code-along #####

# ggplot()
install.packages("palmerpenguins")
library(palmerpenguins)
view(penguins)

ggplot(penguins)

penguins %>% 
  ggplot()

# aes()
glimpse(penguins) # to see which variables are numeric
view(penguins) # to see the actual dataset
ggplot(penguins, aes(x = body_mass_g))

# geom_* 1
ggplot(penguins, aes(x = body_mass_g)) + 
  geom_histogram()

# geom_* 2
# If we want to see the description of each row, we can see the help page: ??palmerpenguins::penguins
ggplot(penguins, aes(x = bill_length_mm, 
                     y = bill_depth_mm)) +
  geom_point()

# a 3rd variable
ggplot(penguins,
       aes(x = bill_length_mm,
           y = bill_depth_mm,
           color = species)) +
  geom_point()

# More additions
ggplot(penguins,
       aes(x = bill_length_mm,
           y = bill_depth_mm,
           color = species)) +
  geom_point() +
  geom_smooth(method = "lm") + # adds a linear regression line to a plot by fitting a linear model ("lm") to the data
  theme_bw() # creates a theme with a white background and thin gray grid lines

# Facet_wrap:
ggplot(penguins,
       aes(x = bill_length_mm,
           y = bill_depth_mm,
           color = species)) +
  geom_point() +
  geom_smooth(method = "lm") + 
  theme_bw() +
  facet_wrap(penguins$species)
  # When you put $ after your data frame, it displays the names of its columns 
  # (press tab to see the list of columns).
             
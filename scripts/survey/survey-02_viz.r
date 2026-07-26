## -------------------------------------------- ##
# Survey Data Preliminary Visualization
## -------------------------------------------- ##
# Purpose
## Do preliminary analysis/visualization of survey data

# Load libraries
# install.packages("librarian")
librarian::shelf(tidyverse)

# Get set up
source(file.path("scripts", "survey", "-setup.r"))

# Clear environment/collect garbage
rm(list = ls()); gc()

# Read in data
svy_v01 <- read.csv(file.path("data", "survey-01_tidied.csv"))

# Check structure
dplyr::glimpse(svy_v01)

## -------------------------------------------- ##
# AI/Data Science Graphs ----
## -------------------------------------------- ##



## -------------------------------------------- ##
# Demographic Graphs ----
## -------------------------------------------- ##




# End ----

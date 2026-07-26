## -------------------------------------------- ##
# Survey Data Preliminary Visualization
## -------------------------------------------- ##
# Purpose
## Do preliminary analysis/visualization of survey data

# Load libraries
# install.packages("librarian")
librarian::shelf(tidyverse, supportR)

# Get set up
source(file.path("scripts", "survey", "-setup.r"))

# Clear environment/collect garbage
rm(list = ls()); gc()

# Load any custom functions
purrr::walk(.x = dir(path = file.path("scripts", "tools"), pattern = "*.r", full.names = TRUE),
  .f = ~ source(file = .x))

# Read in data
svy_v01 <- read.csv(file.path("data", "survey-01_tidied.csv")) %>% 
  dplyr::mutate(dplyr::across(.cols = dplyr::everything(),
    .fns = ~ ifelse(nchar(.) == 0, yes = NA, no = .)))

# Check structure
dplyr::glimpse(svy_v01)

# Read in survey question lookup table too
lkup <- read.csv(file.path("data", "question-lookup-table.csv"))
# dplyr::glimpse(lkup)

## -------------------------------------------- ##
# AI/Data Science Graphs ----
## -------------------------------------------- ##

ai_freq_cols <- c("Daily" = "#e9ecef", "Weekly" = "#adb5bd", 
  "Monthly" = "#6c757d", "Yearly" = "#343a40", "Never" = "#000")

# AI frequency question
graph_freqs(df = svy_v01, q = "AIUse_Freq") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#fff") +
  geom_hline(yintercept = 25, linetype = 3, color = "#fff") +
  scale_fill_manual(values = ai_freq_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "AIUse_Freq"], width = 45)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_ai-frequency.png"),
  height = 5, width = 5, units = "in")

## -------------------------------------------- ##
# Demographic Graphs ----
## -------------------------------------------- ##




# End ----

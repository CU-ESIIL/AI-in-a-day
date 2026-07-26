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
# AI Frequency Graph ----
## -------------------------------------------- ##

# Make custom color palette
ai_freq_cols <- c("Daily" = "#e9ecef", "Weekly" = "#adb5bd", 
  "Monthly" = "#6c757d", "Yearly" = "#343a40", "Never" = "#000")

# Actually make graph
graph_freqs(df = svy_v01, q = "AIUse_Freq") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#fff") +
  geom_hline(yintercept = 25, linetype = 3, color = "#fff") +
  scale_fill_manual(values = ai_freq_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "AIUse_Freq"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_ai-frequency.png"),
  height = 7, width = 7, units = "in")

## -------------------------------------------- ##
# AI Use Reasons Graph ----
## -------------------------------------------- ##

unique(svy_v01$AIUse_reasons)


## -------------------------------------------- ##
# Task Interest Graph ----
## -------------------------------------------- ##

unique(svy_v01$Task_interest)

## -------------------------------------------- ##
# Tech Skill Interest Graph ----
## -------------------------------------------- ##

unique(svy_v01$TechSkill_Interest)

## -------------------------------------------- ##
# Training Received Graph ----
## -------------------------------------------- ##

unique(svy_v01$Training_Received)

## -------------------------------------------- ##
# Training Desired Graph ----
## -------------------------------------------- ##

unique(svy_v01$Training_Desired)


## -------------------------------------------- ##
# General Attitude Graph ----
## -------------------------------------------- ##

# Make custom color palette
attitude_cols <- c("Opposed to GenAI" = "#8f2d56", "Cautious" = "#d81159",
  "A mix of caution and enthusiasm" = "#ffbc42",
  "Enthusiastic" = "#0496ff", "Very enthusiastic" = "#006ba6",
  "Indifferent" = "#adb5bd",
  "Other" = "#343a40")

# Actually make graph
svy_v01 %>% 
  dplyr::mutate(Gen_Attitude = gsub("Other \\(please specify\\)", 
    replacement = "Other",x = Gen_Attitude)) %>% 
graph_freqs(df = ., q = "Gen_Attitude") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#000") +
  geom_hline(yintercept = 25, linetype = 3, color = "#000") +
  scale_fill_manual(values = attitude_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "Gen_Attitude"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_general-attitude.png"),
  height = 7, width = 7, units = "in")

## -------------------------------------------- ##
# Promising Opportunities Graph ----
## -------------------------------------------- ##

unique(svy_v01$PromisingOpps)


## -------------------------------------------- ##
# Challenges Graph ----
## -------------------------------------------- ##

unique(svy_v01$Challenges)


## -------------------------------------------- ##
# Policies Graph ----
## -------------------------------------------- ##

# Check contents
unique(svy_v01$Policies)

# Make custom color palette
policy_cols <- c(
  "Very restrictive/opposed" = "#8f2d56",
  "Somewhat restrictive/opposed" = "#d81159",
  "Neutral" = "#ffbc42",
  "Somewhat permissive/supportive" = "#0496ff", 
  "Very permissive/supportive" = "#006ba6",
  "No institutional policy" = "#000",
  "Other" = "#343a40")

# Actually make graph
svy_v01 %>% 
  dplyr::mutate(Policies = gsub("Other \\(please specify\\)", 
    replacement = "Other", x = Policies)) %>% 
  dplyr::mutate(Policies = gsub("There are not any policies or guidelines at my institution", 
    replacement = "No institutional policy", x = Policies)) %>% 
graph_freqs(df = ., q = "Policies") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#000") +
  geom_hline(yintercept = 25, linetype = 3, color = "#000") +
  scale_fill_manual(values = policy_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "Policies"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_policies.png"),
  height = 7, width = 7, units = "in")

## -------------------------------------------- ##
# Career Stage Graph ----
## -------------------------------------------- ##

# Check contents
unique(svy_v01$Career_Stage)

# Make custom color palette
stage_cols <- c(
  "Prep (graduate student)" = "#99e2b4",
  "Early (1-9 years post-degree)" = "#67b99a",
  "Mid-Career (10-25 years)" = "#358f80",
  "Mature (26+ Years)" = "#036666")

# Actually make graph
svy_v01 %>% 
  dplyr::mutate(Career_Stage = dplyr::case_when(
    Career_Stage == "Preparation Stage (Currently pursuing a graduate degree)" ~ "Prep (graduate student)",
    Career_Stage == "Early Career Stage (1–9 years of experience post-degree)" ~ "Early (1-9 years post-degree)",
    Career_Stage == "Mid-Career Stage (10–25 years of experience)" ~ "Mid-Career (10-25 years)",
    Career_Stage == "Mature Career Stage (26+ years of experience)" ~ "Mature (26+ Years)")) %>% 
graph_freqs(df = ., q = "Career_Stage") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#000") +
  geom_hline(yintercept = 25, linetype = 3, color = "#000") +
  scale_fill_manual(values = stage_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "Career_Stage"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_career-stage.png"),
  height = 7, width = 7, units = "in")

## -------------------------------------------- ##
# Professional Role Graph ----
## -------------------------------------------- ##

unique(svy_v01$Prof_Role)


## -------------------------------------------- ##
# Work Sector Graph ----
## -------------------------------------------- ##

# Check contents
unique(svy_v01$Work_Sector)

# Make custom color palette
sector_cols <- c(
  "Academia (Higher Education)" = "#adb5bd",
  "Non-Profit / NGO" = "#f79256",
  "Government (Federal, State, Local, Tribal)" = "#f8e16c",
  "Industry / Private Sector" = "#ffc2b4",
  "Other" = "#343a40")

# Actually make graph
svy_v01 %>% 
  dplyr::mutate(Work_Sector = dplyr::case_when(
    Work_Sector == "Other (please specify)" ~ "Other",
    TRUE ~ Work_Sector)) %>% 
graph_freqs(df = ., q = "Work_Sector") +
  # geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  # geom_hline(yintercept = 50, linetype = 2, color = "#000") +
  geom_hline(yintercept = 25, linetype = 3, color = "#000") +
  scale_fill_manual(values = sector_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "Work_Sector"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_work-sector.png"),
  height = 7, width = 7, units = "in")

## -------------------------------------------- ##
# Formal Education Graph ----
## -------------------------------------------- ##

# Check contents
unique(svy_v01$Formal_Ed)

# Make custom color palette
formal_ed_cols <- c(
  "Doctoral" = "#b5838d",
  "Master's" = "#e5989b",
  "4-Year" = "#ffb4a2",
  "Other" = "#343a40")

# Actually make graph
svy_v01 %>% 
  dplyr::mutate(Formal_Ed = dplyr::case_when(
    Formal_Ed == "Doctoral degree (Ph.D., Sc.D., etc.)" ~ "Doctoral",
    Formal_Ed == "Master’s degree (M.S., M.A., etc.)" ~ "Master's",
    Formal_Ed == "4-year undergraduate degree (B.S., B.A., etc.)" ~ "4-Year",
    Formal_Ed == "Other (please specify)" ~ "Other",
    TRUE ~ Formal_Ed)) %>% 
graph_freqs(df = ., q = "Formal_Ed") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#000") +
  geom_hline(yintercept = 25, linetype = 3, color = "#000") +
  scale_fill_manual(values = formal_ed_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "Formal_Ed"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_formal-education.png"),
  height = 7, width = 7, units = "in")

## -------------------------------------------- ##
# Field Graph ----
## -------------------------------------------- ##

unique(svy_v01$Field)
# <frequency!>


## -------------------------------------------- ##
# Data Science Frequency Graph ----
## -------------------------------------------- ##

unique(svy_v01$DS_Freq)
# <frequency!>

# !!! Note: holding off on drafting this graph's code until we get more responses !!!


## -------------------------------------------- ##
# Gender Graph ----
## -------------------------------------------- ##

# Check contents
unique(svy_v01$Gender)

# Make custom color palette
gender_cols <- c(
  "Woman" = "#ff193b",
  "Non-binary" = "#ffc719",
  "Man" = "#9529ff",
  "Prefer to self-identify" = "#343a40",
  "Prefer not to answer" = "#000")

# Actually make graph
svy_v01 %>% 
  dplyr::mutate(Gender = dplyr::case_when(
    Gender == "Prefer to self-identify:" ~ "Prefer to self-identify",
    TRUE ~ Gender)) %>% 
graph_freqs(df = ., q = "Gender") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#000") +
  geom_hline(yintercept = 25, linetype = 3, color = "#000") +
  scale_fill_manual(values = gender_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "Gender"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_gender.png"),
  height = 7, width = 7, units = "in")

## -------------------------------------------- ##
# LGBT Graph ----
## -------------------------------------------- ##

# Check contents
unique(svy_v01$LGBTQIA)

# Make custom color palette
lgbt_cols <- c(
  "No" = "#826aed",
  "Yes" = "#ffb7ff",
  "Prefer to self-identify" = "#343a40",
  "Prefer not to answer" = "#000")

# Actually make graph
svy_v01 %>% 
  dplyr::mutate(LGBTQIA = dplyr::case_when(
    LGBTQIA == "Prefer to self-identify:" ~ "Prefer to self-identify",
    TRUE ~ LGBTQIA)) %>% 
graph_freqs(df = ., q = "LGBTQIA") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#000") +
  geom_hline(yintercept = 25, linetype = 3, color = "#000") +
  scale_fill_manual(values = lgbt_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "LGBTQIA"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_lgbtqia.png"),
  height = 7, width = 7, units = "in")

## -------------------------------------------- ##
# Race/Ethnicity Graph ----
## -------------------------------------------- ##

unique(svy_v01$Race_Ethnicity)

## -------------------------------------------- ##
# Neurodiverse Graph ----
## -------------------------------------------- ##

# Check contents
unique(svy_v01$Neurodiverse)

# Make custom color palette
neuro_cols <- c(
  "No" = "#7b2cbf",
  "Yes" = "#ff8500",
  "Prefer not to answer" = "#000")

# Actually make graph
graph_freqs(df = svy_v01, q = "Neurodiverse") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#000") +
  geom_hline(yintercept = 25, linetype = 3, color = "#000") +
  scale_fill_manual(values = neuro_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "Neurodiverse"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_neurodiverse.png"),
  height = 7, width = 7, units = "in")

## -------------------------------------------- ##
# Caregiver Graph ----
## -------------------------------------------- ##

unique(svy_v01$Caregiver)
# <frequency!>

## -------------------------------------------- ##
# FirstGen Graph ----
## -------------------------------------------- ##

# Check contents
unique(svy_v01$FirstGen)

# Make custom color palette
first_gen_cols <- c(
  "No" = "#04471c",
  "Yes" = "#16db65",
  "Prefer not to answer" = "#000")

# Actually make graph
graph_freqs(df = svy_v01, q = "FirstGen") +
  geom_hline(yintercept = 75, linetype = 3, color = "#000") +
  geom_hline(yintercept = 50, linetype = 2, color = "#000") +
  geom_hline(yintercept = 25, linetype = 3, color = "#000") +
  scale_fill_manual(values = first_gen_cols) +
  labs(x = "", y = "Percent Responses (%)",
    title = stringr::str_wrap(string = lkup$question_text[lkup$name_in_data == "FirstGen"], width = 70)) +
  supportR::theme_lyon(title_size = 20, text_size = 16) +
  theme(axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    legend.title = element_blank())

# Export locally
ggsave(file.path("graphs", "survey-02_first-gen.png"),
  height = 7, width = 7, units = "in")

# End ----

library(tidyverse)

incidence <- read_delim(
  here::here("data", "United States and Puerto Rico Cancer Statistics, 1999-2016 Incidence.txt"),
  delim = "\t",
  n_max = 90, 
  na = "Not Applicable")

incidence %>% 
  filter(Race != "Other Races and Unknown combined",
         Race != "American Indian or Alaska Native") %>%
  mutate(Race = recode(Race, 
                       "Black or African American" = "Black",
                       "Asian or Pacific Islander" = "Asian/PI")) %>%
  mutate(label = if_else(Year == max(Year), Race, NA_character_)) %>%
  select(Year, Race, label, `Age-Adjusted Rate`, 
         `Age-Adjusted Rate Upper 95% Confidence Interval`,
         `Age-Adjusted Rate Upper 95% Confidence Interval`) %>%
  write_rds(here::here("data", "incidence.rds"))

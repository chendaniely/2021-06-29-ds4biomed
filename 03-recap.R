library(tidyverse)
library(readxl)

tumor <- read_excel("data/medicaldata_tumorgrowth.xlsx")

tumor %>%
  filter(Day == 21) %>%
  group_by(Group) %>%
  summarize(avg = mean(Size))

library(tidyverse)

tumor <- read_csv("data/tumorgrowth_long.csv")

tumor %>%
  pivot_longer(`0`:`28`)

tumor_tidy <- tumor %>%
  pivot_longer(`0`:last_col(), names_to = "day", values_to = "size")

tumor_tidy %>%
  group_by(Group, day) %>%
  summarize(avg_size = mean(size, na.rm = TRUE)) %>%
  mutate(day_num = as.numeric(day)) %>%
  arrange(desc(Group), day_num)

tb <- read_csv("data/tb_long.csv")
tb

tb %>%
  pivot_longer(starts_with(c("m", "f"))) %>%
  separate(name, sep = 1, into = c("sex", "age_group"))

cms <- read_csv("data/cms_utilization.csv")
cms

cms_long <- cms %>%
  pivot_longer(`2007`:last_col(), names_to = "year")

cms_long %>%
  pivot_wider(names_from = variable, values_from = value)

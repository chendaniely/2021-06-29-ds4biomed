library(tidyverse)

tumor_subset <- read_csv("data/tumor_subset.csv")

tumor_subset %>%
  filter(Day == 0) %>%
  select(Size)

tumor_subset %>%
  filter(Day == 0) %>%
  pull(Size)

tumor_subset %>%
  filter(Day == 0) %>%
  pull(Size) %>%
  mean()

tumor_subset %>%
  filter(Group == 1, Day == 0) %>%
  pull(Size) %>%
  mean()

tumor_subset %>%
  filter(Group == 1, Day == 0) %>%
  pull(Size) %>%
  mean()

tumor_subset %>%
  filter(Group == 2, Day == 0) %>%
  pull(Size) %>%
  mean()

tumor_subset %>%
  pull(Group) %>%
  unique()

tumor_subset %>%
  group_by(Group, Day) %>%
  summarize(avg_size = mean(Size),
            sd_size = sd(Size))

library(tidyverse)
library(ggplot2)
library(medicaldata)

blood <- blood_storage

class(blood)
names(blood)

blood %>%
  group_by(Recurrence) %>%
  summarize(count = n())

ggplot(data = blood,
       mapping = aes(x = Recurrence)
       ) +
  geom_bar()

recurrence_freq <- blood %>%
  group_by(Recurrence) %>%
  summarize(count = n())

ggplot(data = recurrence_freq,
       mapping = aes(x = Recurrence,
                     y = count)
) +
  geom_bar(stat = "identity")

ggplot(blood, aes(x = Age)) +
  geom_histogram()

ggplot(blood, aes(x = Age)) +
  geom_histogram(bins = 10)

ggplot(blood) +
  geom_boxplot(aes(x = as.factor(TVol),
                   y = Age))
ggplot(blood) +
  geom_violin(aes(x = as.factor(TVol),
                   y = Age))

library(tidyverse)
library(readxl)

# getwd()

tumor <- read_csv("data/medicaldata_tumorgrowth.csv")
tumor_xl <- read_excel("data/medicaldata_tumorgrowth.xlsx")

class(tumor)
class(tumor_xl)

select(tumor, Size)

select(tumor, Size, Group, Day)

select(tumor, ID:Size, Group)

tumor %>%
  select(ID:Size, Group)

tumor_subset <- tumor %>%
  select(ID:Size, Group)

# Filter row

filter(tumor, Group == 1)

tumor %>%
  filter(Group == 1)

tumor %>%
  # filter rows
  filter(Group == 1, Day == 0)

tumor %>%
  filter(Group == 1 & Day == 0)

tumor %>%
  filter(Group == 1 & (Day == 0 | Day == 13))

tumor %>%
  filter(Group == 1 & (Day == 0 | Day == 13)) %>%
  select(ID:Size)

tumor %>%
  filter(Group == 1 & (Day == 0 | Day == 13)) %>%
  select(ID:Size) %>%
  filter(Size > 100)

# tumor
# cols: group, id, day, size
# row: day 0, 13

tumor_subset <- tumor %>%
  select(Group, ID, Day, Size) %>%
  filter(Day == 0 | Day == 13)

write_csv(tumor_subset, "data/tumor_subset.csv")

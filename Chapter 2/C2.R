# 2.3 The Tidyverse
install.packages("tidyverse")
library(tidyverse)

install.packages("remotes")

remotes::install_github("beanumber/abdwr3edata")
library(abdwr3edata)

# 2.4.2 Introduction
# Selecting a subset of rows/columns by index
spahn |> slice(1:3) |> select(1:10) 

# Selecting a subset of rows/columns by index and name
spahn |> slice(1:10) |> select(Age, W, L, ERA) 

# Summarizing ERA statistics
spahn |>
  summarize(
    LO = min(ERA), 
    QL = quantile(ERA, .25), 
    QU = quantile(ERA, .75),
    M = median(ERA), 
    HI = max(ERA)
  )

# Finding age at which Spahn had their lowest ERA
spahn |> 
  filter(ERA == min(ERA)) |> 
  select(Age)

# mutate function - adding a new column based on the provided formula
spahn <- spahn |> 
  mutate(FIP = (13 * HR + 3 * BB - 2 * SO) / IP)

# arrange function sorts by column
spahn |> 
  arrange(FIP) |> 
  select(Year, Age, W, L, ERA, FIP) |>
  slice(1:6)

# Good example of a pipeline
# | - OR operator
# grouping output by team
spahn |> 
  filter(Tm == "BSN" | Tm == "MLN") |>
  group_by(Tm) |> 
  summarize(
    mean_W.L = mean(W.L, na.rm = TRUE),
    mean_ERA = mean(ERA),
    mean_WHIP = mean(WHIP),
    mean_FIP = mean(FIP)
  )



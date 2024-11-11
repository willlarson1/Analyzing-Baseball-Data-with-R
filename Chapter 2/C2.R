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
  arrange(FIP) |> # sorts by FIP
  select(Year, Age, W, L, ERA, FIP) |> # selects certain columns
  slice(1:6) # takes top 6 rows

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

# merging data frames - adding additional observations
batting <- bind_rows(NLbatting, ALbatting)
summary(batting)
head(batting)

# merging data frames - adding additional columns
NL <- inner_join(NLbatting, NLpitching, by = "Tm")
head(NL)

#filtering data frame
NL_150 <- NLbatting |> 
  filter(HR > 150)

head(NL_150)

# 2.5 - Vectors
# Spahn's wins and losses post-war
W <- c(8, 21, 15, 21, 21, 22, 14)
L <- c(5, 10, 12, 14, 17, 14, 19)
win_pct <- 100 * W / (W + L)
win_pct
Year <- seq(from=1946, to=1952) # can also use colons: "Year <- 1946:1952

Age <- Year - 1921

# Plot function
plot(Age, win_pct)

# Various vector functions
mean(win_pct)
100 * sum(W) / (sum(W) + sum(L))
sort(W)
cumsum(W)
summary(win_pct)

# Extract values from vector
W[c(1, 2, 5)]
W[1 : 4]
# Remove entries from vector
W[-c(1, 6)]
# Logical variables with a vector
win_pct > 60
(W > 20) & (win_pct > 60)

win_pct == max(win_pct)
Year[win_pct == max(win_pct)]
Year[W + L > 30]

# 2.6 - Objects and Containers in R
Year <- 2008 : 2017
NL <- c("PHI", "PHI", "SFN", "SLN", "SFN",
        "SLN", "SFN", "NYN", "CHN", "LAN")
AL <- c("TBA", "NYA", "TEX", "TEX", "DET",
        "BOS", "KCA", "KCA", "CLE", "HOU")
Winner <- c("NL", "AL", "NL", "NL", "NL",
            "AL", "NL", "AL", "NL", "AL")
N_Games <- c(5, 6, 5, 7, 4, 7, 7, 5, 7, 7)

# Creating a data frame from multiple vectors
WS_results <- tibble(
  Year = Year, NL_Team = NL, AL_Team = AL,
  N_Games = N_Games, Winner = Winner)
WS_results

grep("NY", c(AL, NL), value = TRUE)
WS <- WS_results |> group_by(Winner) |> summarize(N = n())
WS

# Making a bar chart
ggplot(WS, aes(x = Winner, y = N)) + geom_col()
ggplot(WS_results, aes(x = Winner)) + geom_bar()

WS_results |> 
  group_by(NL_Team) |> 
  summarize(N = n())

WS_results <- WS_results |>
  mutate(
    NL_Team = factor(
      NL_Team, 
      levels = c("NYN", "PHI", "CHN", "SLN", "LAN", "SFN")
    )
  )

str(WS_results$NL_Team)

# Lists
world_series <- list(
  Winner = Winner, 
  Number_Games = N_Games,
  Seasons = "2008 to 2017"
)
world_series$Number_Games
world_series[[2]]
pluck(world_series, "Number_Games")
world_series["Number_Games"]

WS_results$NL_Team

# 2.7
library(Lahman)
ws <- SeriesPost |>
  filter(yearID >= 1903, round == "WS", wins + losses < 8)
ggplot(ws, aes(x = wins + losses)) +
  geom_bar(fill = crcblue) +
  labs(x = "Number of games", y = "Frequency")

hr_rates <- function(age, hr, ab) {
  rates <- round(100 * hr / ab, 1)
  list(x = age, y = rates)
}

HR <- c(13, 23, 21, 27, 37, 52, 34, 42, 31, 40, 54)
AB <- c(341, 549, 461, 543, 517, 533, 474, 519, 541, 527, 514)
Age <- 19 : 29
hr_rates(Age, HR, AB)
plot(hr_rates(Age, HR, AB))

mantle_hr_rates <- hr_rates(Age, HR, AB)
Mantle <- tibble(
  Age, HR, AB, Rates = mantle_hr_rates$y
)
write_csv(Mantle, here::here("Chapter 2/mantle.csv"))
list.files(here::here("Chapter 2"), pattern = "mantle")

# 2.10 Splitting, Applying, and Combining Data

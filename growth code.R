########################################################################################
#  Growth of the SDA church in the post Millenia
#    Analysis using EDA
##################################################################


# Load packages
library(tidyverse)
library(gganimate)
library(gapminder)
library(plotly)
library(tibble)
library(lubridate)
library(maps)
library(ggthemes)
library(babynames)
library(hrbrthemes)
library(viridis)
library(gridExtra)
library(cowplot)
library(xlsx)

# Load data
s1 <- read.csv(file.choose())
s2 <- read.csv(file.choose())
s3 <- read.csv(file.choose())
s4 <- read.csv(file.choose())
s5 <- read.csv(file.choose())
s6 <- read.csv(file.choose())
s7 <- read.csv(file.choose())
s8 <- read.csv(file.choose())
s9 <- read.csv(file.choose())
s10 <- read.csv(file.choose())
s11 <- read.csv(file.choose())
s12 <- read.csv(file.choose())
s13 <- read.csv(file.choose())
s14 <- read.csv(file.choose())
s15 <- read.csv(file.choose())



# Combining datasets
sda <- rbind(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15)
glimpse(sda)
View(sda)
sda$FieldName <- tolower(sda$FieldName)
write.xlsx(sda, "Sda Statistics.xlsx")

#Filter
sda_1 <- sda %>%
  filter( Year >= 2000) %>%
  group_by(Year, FieldName) %>%
  summarise(members = sum(BegMem))


# Gaphs ----

ggplot(sda_1, aes(x=Year, y= members)) +
  geom_line(aes(linetype=FieldName, color = FieldName)) +
  geom_point(aes(linetype=FieldName, color = FieldName)) +
  ggtitle("Distribution of the SDA church membership by Year") +
  theme_ipsum() +
  xlab('Year') +
  ylab("Church membership") +
  transition_reveal(Year)

# Save at gif:
anim_save("Yearly membership in the SDA.gif")



# Pat Sheehy
# Wrangling Project

rm(list=ls())

setwd("C:/Users/patsheehy/Downloads")
getwd()

pcountries <- read.csv("wrangling_countries.csv")
pcountries

library(ggplot2)
library(scales)
library(dplyr)

# 3.1 GDP Correlation
population <- cor(pcountries$GDP....per.capita., pcountries$Population)
area <- cor(pcountries$GDP....per.capita., pcountries$Area)
migration <- cor(pcountries$GDP....per.capita., pcountries$Net.migration)
infant <- cor(pcountries$GDP....per.capita., pcountries$Infant.mortality..per.1000.births.)
literacy <- cor(pcountries$GDP....per.capita., pcountries$Literacy....)
phones <- cor(pcountries$GDP....per.capita., pcountries$Phones..per.1000.)
crops <- cor(pcountries$GDP....per.capita., pcountries$Crops....)
climate <- cor(pcountries$GDP....per.capita., pcountries$Climate)
birthrate <- cor(pcountries$GDP....per.capita., pcountries$Birthrate)
deathrate <- cor(pcountries$GDP....per.capita., pcountries$Deathrate)
agriculture <- cor(pcountries$GDP....per.capita., pcountries$Agriculture)
industry <- cor(pcountries$GDP....per.capita., pcountries$Industry)
service <- cor(pcountries$GDP....per.capita., pcountries$Service)

GDP_correlation <- table(population,area,migration,infant,literacy,phones,crops,climate,birthrate,deathrate,agriculture,industry,service)
View(GDP_correlation)

# 3.2 GDP and Migration

qplot(Net.migration, GDP....per.capita., data=pcountries, geom="density")

# 3.3 GDP and Service

summary(pcountries)


boxplot(pcountries$Population~pcountries$Service, xlab = 'Service', ylab = 'Population')
boxplot(pcountries$GDP....per.capita.~pcountries$Service, xlab = 'Service', ylab = 'GDP Per Capita')
boxplot(pcountries$Deathrate~pcountries$Service, xlab = 'Service', ylab = 'DeathRate')
barplot(pcountries$Service, xlab = "Country", ylab = 'Service')

# 3.4 GDP and Literacy


qplot(Literacy....,GDP....per.capita.,data = pcountries,xlab = 'Literacy',ylab = 'GDP')

# 3.5 GDP and Phones

shapiro.test(pcountries$GDP....per.capita.)
shapiro.test(pcountries$Phones..per.1000.)

plot(pcountries$GDP....per.capita., pcountries$Phones..per.1000., xlab = "GDP", ylab = "Phones", main = "GDP & Phones")


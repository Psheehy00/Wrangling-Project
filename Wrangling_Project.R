# Pat Sheehy
# Wrangling Project

rm(list=ls())

setwd("C:/Users/patsheehy/Downloads")
getwd()

################################################################################
# Scraping country data

library(xml2)
countries_site <- read_html("https://www.scrapethissite.com/pages/simple/")
countries_site

Country <- xml_text(xml_find_all(countries_site, "//div[@class = 'col-md-4 country']/h3"))
Capital <- xml_text(xml_find_all(countries_site, "//div[@class = 'col-md-4 country']/div[@class = 'country-info']/span[@class = 'country-capital']"))
Population <- xml_text(xml_find_all(countries_site, "//div[@class = 'col-md-4 country']/div[@class = 'country-info']/span[@class = 'country-population']"))
Area <- xml_text(xml_find_all(countries_site, "//div[@class = 'col-md-4 country']/div[@class = 'country-info']/span[@class = 'country-area']"))

Country <- gsub("\n", "", Country)
Country <- gsub("  ", "", Country)
Country

countries_scrape <- data.frame(Country, Capital, Population, Area)
View(countries_scrape)

################################################################################
# Reading in our CSV data

countries_csv <- read.csv("countries_of_the_world.csv")
countries_csv$Country <- gsub(" ", "", countries_csv$Country)
countries_csv

################################################################################
# Integrating our data together

countries <- merge(countries_scrape, countries_csv, by.x = "Country", by.y = "Country", all.x = TRUE, na.rm = TRUE)
countries
countries2 <- na.omit(countries)
View(countries2)

write.csv(countries2, "wrangling_countries.csv")




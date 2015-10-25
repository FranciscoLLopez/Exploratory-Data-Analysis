################################################################################
## OS Windows 10 
## LOAD DATA 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./dataset/summarySCC_PM25.rds")
SCC <- readRDS("./dataset/Source_Classification_Code.rds")

## QUESTION 6 ##################################################################
## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037").
## Which city has seen greater changes over time in motor vehicle emissions?
################################################################################
## Install library
install.packages("ggplot2")
## Load library
library(ggplot2)

## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
png(filename = "plot6.png", width=480, height=480)

## First, get all data from Baltimore and Los Angeles County
cities.data <- NEI[NEI$fips == "24510"|NEI$fips == "06037", ] 


## Second, get all data
## From forums, EI$Sector and "mobile" maybe the best option
vehicle.data <- SCC[grep("mobile", SCC$EI.Sector, ignore.case = TRUE), ]

## Select the sames values from both cities dataset and vehicle dataset 
vehicle.cities <- cities.data[cities.data$SCC %in% vehicle.data$SCC, ]


g <- ggplot(vehicle.cities, aes(year, Emissions,color = fips))
g + geom_point(stat = "summary", fun.y=sum)+
    stat_summary(fun.y=sum, geom="line")+
    labs( y = "Total emission from PM2.5")+
    labs( x = "Year")+
    labs(title = "Total emissions vehicle Baltimore City vs L.A. County")+
    scale_colour_manual(values = c("06037","24510"),
                        labels = c("Los Angeles County","Baltimore City"))

dev.off()


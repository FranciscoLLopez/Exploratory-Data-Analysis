################################################################################
## OS Windows 10 
## LOAD DATA 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./dataset/summarySCC_PM25.rds")
SCC <- readRDS("./dataset/Source_Classification_Code.rds")

## QUESTION 5 ##################################################################
## How have emissions from motor vehicle sources changed from 1999-2008 
## in Baltimore City?
################################################################################
## Install library
install.packages("ggplot2")
## Load library
library(ggplot2)

## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
png(filename = "plot5.png", width=480, height=480)

## First, get all data from Baltimore
baltimore.data <- NEI[NEI$fips == "24510", ] 

## Second, get all data
## From forums, EI$Sector and "mobile" maybe the best option
vehicle.data <- SCC[grep("mobile", SCC$EI.Sector, ignore.case = TRUE), ]

## Select the sames values from Baltimore dataset and vehicle dataset 
vehicle.baltimore <- baltimore.data[baltimore.data$SCC %in% vehicle.data$SCC, ]


g <- ggplot(vehicle.baltimore, aes(year, Emissions))
g + geom_point(stat = "summary", fun.y=sum)+
    stat_summary(fun.y=sum, geom="line")+
    labs( y = "Total emission from PM2.5")+
    labs( x = "Year")+
    labs(title = "Total emissions motor vehicle from 1999 to 2008 in Baltimore City")

dev.off()


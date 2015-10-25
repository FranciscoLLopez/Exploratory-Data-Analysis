################################################################################
## OS Windows 10 
## LOAD DATA 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./dataset/summarySCC_PM25.rds")
SCC <- readRDS("./dataset/Source_Classification_Code.rds")

## QUESTION 3 ##################################################################
## Of the four types of sources indicated by the type (point, nonpoint, onroad, 
## nonroad) variable, which of these four sources have seen decreases in 
## emissions from 1999-2008 for Baltimore City? Which have seen increases in 
## emissions from 1999-2008? Use the ggplot2 plotting system to make a plot 
## answer this question.
################################################################################
## Install library
install.packages("ggplot2")
## Load library
library(ggplot2)

## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
png(filename = "plot3.png", width=480, height=480)

# Select from data the Baltimore City values.
baltimore.data <- NEI[NEI$fips == "24510", ] 

g <- ggplot(baltimore.data, aes(year, Emissions, color = type))
g + geom_point(stat = "summary", fun.y=sum)+
    stat_summary(fun.y=sum, geom="line")+
    labs( y = "Emission from PM2.5")+
    labs( x = "Year")+
    labs(title = "Total Emissions from Baltimore City from 1999 to 2008")

dev.off()



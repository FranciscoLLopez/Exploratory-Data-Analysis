################################################################################
## OS Windows 10 
## LOAD DATA 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./dataset/summarySCC_PM25.rds")
SCC <- readRDS("./dataset/Source_Classification_Code.rds")

## QUESTION 4 ##################################################################
## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999-2008?
################################################################################
## Install library
install.packages("ggplot2")
## Load library
library(ggplot2)

## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
png(filename = "plot4.png", width=480, height=480)

# Select from SCC all values with "Coal" string in column Short.Name
coal.subset <- SCC[grep("coal", SCC$Short.Name, ignore.case = TRUE), ]
coal.set <- NEI[NEI$SCC %in% coal.subset$SCC, ]


g <- ggplot(coal.set, aes(year, Emissions))
g + geom_point(stat = "summary", fun.y=sum)+
    stat_summary(fun.y=sum, geom="line")+
    labs( y = "Total emission from PM2.5")+
    labs( x = "Year")+
    labs(title = "Total emissions across the United States from 1999 to 2008")

dev.off()

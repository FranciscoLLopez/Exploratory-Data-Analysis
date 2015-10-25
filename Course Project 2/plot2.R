################################################################################
## OS Windows 10 
## LOAD DATA 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./dataset/summarySCC_PM25.rds")
SCC <- readRDS("./dataset/Source_Classification_Code.rds")

## QUESTION 2 ##################################################################
## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to
## make a plot answering this question.
################################################################################
## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
png(filename = "plot2.png", width=480, height=480)

# Select from data the Baltimore City values.
baltimore.data <- NEI[NEI$fips == "24510", ] 

# Get Baltimore City emissions summarized by year
total.emissions <- aggregate(baltimore.data$Emissions,
                             by = list(baltimore.data$year), sum)

plot(total.emissions, type = "l", xlab = "Year", 
     main = "Total Emissions in the Baltimore City from 1999 to 2008", 
     ylab = "Emission from PM2.5")
dev.off()




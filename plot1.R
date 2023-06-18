##Downloading and extracting was done outside R environment

##Load the data

rawdata <- read.table(file = "C:/Users/jonas/Desktop/UKE/Forschung/PhD Programm/Cousera/Data Science Johns Hopkins/Exploratory data analysis/Week 1/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors = FALSE, na.strings = "?", nrows = 2075259, check.names = FALSE, colClasses = c(character(), character(), numeric(), numeric(), numeric(), numeric(), numeric(), numeric(), numeric()))

##Subsetting by rows

tidydata <- data[66637:69516,]

# Transforming the Date and Time vars to Date and POSIXlt respectively
tidydata$Date <- as.Date(tidydata$Date, format="%d/%m/%Y")
tidydata$Time <- strptime(tidydata$Time, format="%H:%M:%S")
tidydata[1:1440,"Time"] <- format(tidydata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
tidydata[1441:2880,"Time"] <- format(tidydata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Open graphics devie

png(filename = "./plot1.png", width = 480, height = 480, units = "px", bg = "white")

##Plotting 
with(tidydata, hist(Global_active_power, col = "red", main = NULL, xlab = "Global Acitve Power(kilowatts)"))
title("Global Active Power")

dev.off()


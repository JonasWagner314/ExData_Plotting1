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

##Print in english
Sys.setlocale("LC_TIME", "English")


##Open graphics devie

png(filename = "./plot4.png", width = 480, height = 480, units = "px", bg = "white")

par(mfrow=c(2,2))

plot(tidydata$Time,as.numeric(as.character(tidydata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(tidydata$Time,as.numeric(as.character(tidydata$Voltage)),type="l",xlab="",ylab="Voltage")
plot(tidydata$Time,as.numeric(as.character(tidydata$Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering")
with(tidydata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(tidydata,lines(Time,as.numeric(as.character(Sub_metering_2)),col = "red"))
with(tidydata,lines(Time,as.numeric(as.character(Sub_metering_3)), col = "blue"))

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(tidydata$Time,as.numeric(as.character(tidydata$Global_reactive_power)),type="l",xlab="",ylab="Global_reactive_power")

dev.off()






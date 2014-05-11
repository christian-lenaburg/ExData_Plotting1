
# Load Libraries
library(lubridate)

# Define Data Path
data_path <- "C:/Users/Christian/Desktop/Coursera/datasciencecoursera/ExploreDataAssignment1"

setwd(data_path)

# End Load Libraries & Define Data Path


# ***********************************************************************************************************************
# (1) Read Data
# ***********************************************************************************************************************
# Download, read & subset data
download.file(url      = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "./Data/Household Power Consumption.zip")

data <- read.table(unz("Data/Household Power Consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", na.strings="?")

# Convert date from factor to date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Create Date/Time stamp
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S", tz="EST")

# End Read Data


# ***********************************************************************************************************************
# (2) Plot 4: Dashboard with Different Plots
# ***********************************************************************************************************************
# Open PNG device; create 'Plot1.png' in working directory
png(filename = "Plot4.png", width=480, height=480, bg="transparent")

# Create plots and send to a file (no plot appears on screen)
par(mfrow = c(2, 2),ps=12)

plot(y=data$Global_active_power, x=data$DateTime, ylab="Global Active Power", xlab="", type="l")

plot(y=data$Voltage, x=data$DateTime, ylab="Voltage", xlab="datetime", type="l")


plot (y=data$Sub_metering_1, x=data$DateTime, ylab="Energy sub metering", xlab="", type="l", col="black")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1), bty="n")
lines(y=data$Sub_metering_2, x=data$DateTime, ylab="Energy sub metering", xlab="", type="l", col="red"  )
lines(y=data$Sub_metering_3, x=data$DateTime, ylab="Energy sub metering", xlab="", type="l", col="blue" )

plot(y=data$Global_reactive_power, x=data$DateTime, ylab="Global_reactive_power", xlab="datetime", type="l")

# Close the PNG file device
dev.off()

# End Plot 4: Dashboard with Different Plots
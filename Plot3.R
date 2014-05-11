
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
# (2) Plot 3: Timeseries of of Different Submeters with Legend
# ***********************************************************************************************************************
# Open PNG device; create 'Plot1.png' in working directory
png(filename = "Plot3.png", width=480, height=480, bg="transparent")

# Create plot and send to a file (no plot appears on screen)
plot (y=data$Sub_metering_1, x=data$DateTime, ylab="Energy sub metering", xlab="",type="l", col="black")
lines(y=data$Sub_metering_2, x=data$DateTime, ylab="Energy sub metering", xlab="",type="l", col="red")
lines(y=data$Sub_metering_3, x=data$DateTime, ylab="Energy sub metering", xlab="",type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1))

# Close the PNG file device
dev.off()

# End Plot 3: Timeseries of of Different Submeters with Legend
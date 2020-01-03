# Download and unzip
if (!file.exists("data.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
}  
if (!file.exists("household_power_consumption.txt")) { 
    unzip("data.zip") 
}

# Read in data
power <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";", na.strings = "?", header=TRUE)

# Subset data
power <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

# Set datetime
power$DateTime <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

# save png
png("plot3.png", width=480, height=480)
plot(power$DateTime, power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(power$DateTime, power$Sub_metering_1)
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
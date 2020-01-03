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

# save png of hist
png("plot1.png", width=480, height=480)
hist(power_filtered$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()

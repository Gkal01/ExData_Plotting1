#Reading the data
importdata <- read.csv("household_power_consumption.txt", header = TRUE, 
                       sep = ";", stringsAsFactors=FALSE)

importdata <- subset(importdata, Date == "1/2/2007" | Date == "2/2/2007")

dates <- as.Date(importdata$Date, "%d/%m/%Y")
datetimes <- as.POSIXct(paste(dates, importdata$Time))

#Creating the plot
png("Plot2.png", width=480, height = 480)
plot.new()
plot(importdata$Global_active_power ~ datetimes, type = 'l', 
     ylab = "Global Active Power (kilowatts)", xlab = '')
dev.off()

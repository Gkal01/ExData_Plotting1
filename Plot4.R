#Reading the data
importdata <- read.csv("household_power_consumption.txt", header = TRUE, 
                       sep = ";", stringsAsFactors=FALSE)

importdata <- subset(importdata, Date == "1/2/2007" | Date == "2/2/2007")

dates <- as.Date(importdata$Date, "%d/%m/%Y")
datetimes <- as.POSIXct(paste(dates, importdata$Time))

#Creating the plot
png("Plot4.png", width=480, height = 480)
plot.new()
par(mfrow = c(2,2))

#plot1
plot(importdata$Global_active_power ~ datetimes, type = 'l', 
     ylab = "Global Active Power (kilowatts)", xlab = '')

#plot2
plot(importdata$Voltage ~ datetimes, type = 'l', ylab = "Voltage", 
     xlab = 'datetime')

#plot3
plot(as.numeric(importdata$Sub_metering_1) ~ datetimes, type = 'l', 
     ylab = "Energy sub metering", xlab = '')
lines(as.numeric(importdata$Sub_metering_2) ~ datetimes, type = 'l', 
      col = "red")
lines(as.numeric(importdata$Sub_metering_3) ~ datetimes, type = 'l', 
      col = "blue")
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
plot(as.numeric(importdata$Global_reactive_power) ~ datetimes, type = 'l',
     ylab = "Global_reactive_power", xlab = 'datetime')

dev.off()


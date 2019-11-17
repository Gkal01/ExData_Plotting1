#Reading the data
importdata <- read.csv("household_power_consumption.txt", header = TRUE, 
                       sep = ";", stringsAsFactors=FALSE)

importdata <- subset(importdata, Date == "1/2/2007" | Date == "2/2/2007")

#Creating the plot
png("Plot1.png", width=480, height = 480)
plot.new()
hist(as.numeric(importdata$Global_active_power), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
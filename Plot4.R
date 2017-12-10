#1. Reading Date. Selection of the required Date

Date <- read.table("household_power_consumption.txt",sep=";",header=T, na.string="?")
Date$Date <- as.Date(strptime(Date$Date, "%d/%m/%Y"))

Date <- subset(Date, Date == "2007-02-01" | Date == "2007-02-02")

Date$Date <- strptime(paste(Date$Date, Date$Time,sep=" "), "%Y-%m-%d %H:%M:%S")
Date$Date <- as.POSIXct(Date$Date)

#2.Plot


par(mfrow = c(2, 2))


with(data,plot(Global_active_power ~ Date, type = "l", ylab = "Global Active Power", 
     xlab = ""))

with(data,plot(Voltage ~ Date, type = "l"))

with(data,plot(Sub_metering_1 ~ Date, type = "l", ylab = "Energy sub metering", 
     xlab = ""))

lines(data$Sub_metering_2 ~ data$Date, col = "Red")
lines(data$Sub_metering_3 ~ data$Date, col = "Blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")

with(data,plot(Global_reactive_power ~ Date, type = "l"))

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()


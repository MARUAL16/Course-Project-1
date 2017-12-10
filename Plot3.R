#1. Reading data. Selection of the required data

data <- read.table("household_power_consumption.txt",sep=";",header=T, na.string="?")
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

data$Date <- strptime(paste(data$Date, data$Time,sep=" "), "%Y-%m-%d %H:%M:%S")
data$Date <- as.POSIXct(data$Date)

#2.Plot

with(data,plot(Sub_metering_1 ~ Date, type = "l", 
     ylab = "Energy sub metering", xlab = ""))

lines(data$Sub_metering_2 ~ data$Date,type="l", col = "Red")
lines(data$Sub_metering_3 ~ data$Date, type="l",col = "Blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

                        


#1. Reading data. Selection of the required data

data <- read.table("household_power_consumption.txt",sep=";",header=T, na.string="?")
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

data$Date <- strptime(paste(data$Date, data$Time,sep=" "), "%Y-%m-%d %H:%M:%S")
data$Date <- as.POSIXct(data$Date)

# 2. Plot


with(data,plot(Global_active_power ~ Date, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()


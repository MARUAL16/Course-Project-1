

#1. Reading data. Selection of the required data

data <- read.table("household_power_consumption.txt",sep=";",header=T, na.string="?")
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# 2. Plot

hist(data$Global_active_power,xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")

dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()
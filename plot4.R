data <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time, sep =" "), format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))

par("mar" = c(4,4,4,4))
y <- data$Global_active_power
x <- data$Time
plot(x, y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

par("mar" = c(4,4,4,4))
y <- data$Voltage
x <- data$Time
plot(x, y, type = "l", ylab = "Voltage", xlab = "datetime")

par("mar" = c(4,4,4,4))
x <- data$Time
y1 <- data$Sub_metering_1
y2 <- data$Sub_metering_2
y3 <- data$Sub_metering_3

plot(x,y1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x, y2, col = "red", type = "l")
lines(x, y3, col = "blue", type = "l")
legend("topright", legend = names(data)[7:9], lwd = 1, col = c("black", "red", "blue"))

par("mar" = c(4,4,4,4))
y <- data$Global_reactive_power
x <- data$Time
plot(x, y, type = "l", ylab = names(data)[3], xlab = "datetime")

dev.copy(png, file = "plot4.png")
dev.off()
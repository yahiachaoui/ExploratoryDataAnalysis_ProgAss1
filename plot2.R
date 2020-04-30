data <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time, sep =" "), format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(1,1), "mar" = c(4,4,4,4))
y <- data$Global_active_power
x <- data$Time
plot(x, y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png")
dev.off()
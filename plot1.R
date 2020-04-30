data <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time, sep =" "), format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(1,1), "mar" = c(4,4,4,4))
x <- data$Global_active_power
hist(x, col = "red", xlab = "Global Activity Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()

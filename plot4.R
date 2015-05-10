data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
tmp <- as.Date(data$Date, format = "%d/%m/%Y")
required_data <- data[tmp >= as.Date("2007-02-01") & tmp <= as.Date("2007-02-02"), ]
required_data$DateTime <- with(required_data, strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# top left
with(required_data, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", pch = ""))
with(required_data, lines(DateTime, Global_active_power))

# top right
with(required_data, plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", pch = ""))
with(required_data, lines(DateTime, Voltage))

# bottom left
with(required_data, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", pch = ""))
with(required_data, lines(DateTime, Sub_metering_1))
with(required_data, lines(DateTime, Sub_metering_2, col = "red"))
with(required_data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# bottom right
with(required_data, plot(DateTime, Global_reactive_power, xlab = "datetime", pch = ""))
with(required_data, lines(DateTime, Global_reactive_power))

par(mfrow = c(1,1))
dev.off()
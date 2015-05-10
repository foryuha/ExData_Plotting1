data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
tmp <- as.Date(data$Date, format = "%d/%m/%Y")
required_data <- data[tmp >= as.Date("2007-02-01") & tmp <= as.Date("2007-02-02"), c("Date", "Time", "Global_active_power")]
required_data$DateTime <- with(required_data, strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
png(filename = "plot2.png", width = 480, height = 480)
with(required_data, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch = ""))
with(required_data, lines(DateTime, Global_active_power))
dev.off()
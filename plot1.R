data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
tmp <- as.Date(data$Date, format = "%d/%m/%Y")
required_data <- data[tmp >= as.Date("2007-02-01") & tmp <= as.Date("2007-02-02"), "Global_active_power"]
png(filename = "plot1.png", width = 480, height = 480)
hist(required_data, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
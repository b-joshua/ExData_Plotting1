data_all <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")

data <- data_all[(data_all$Date == as.Date("2007-02-01") | data_all$Date == as.Date("2007-02-02")),]

data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(data$DateTime, data$Sub_metering_1,
  type = "l",
  xlab = "Date and Time",
  ylab = "Energy sub metering"
)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col    = c("black", "red", "blue"),
  lty    = 1
)

dev.off()

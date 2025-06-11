data_all <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")

data <- data_all[(data_all$Date == as.Date("2007-02-01") | data_all$Date == as.Date("2007-02-02")),]

png("plot2.png", width = 480, height = 480)

plot(
  x = strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"),
  y = data$Global_active_power,
  xlab = "Date and Time",
  ylab = "Global Active Power (kilowatts)",
  type = "l"
)

dev.off()

data_all <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")

data <- data_all[(data_all$Date == as.Date("2007-02-01") | data_all$Date == as.Date("2007-02-02")),]

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col  = "red")
dev.off()

# read data from the dates 2007-02-01 and 2007-02-02
data <- read.csv.sql("./household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

# concatenate date and time
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# plot
plot2 <- plot(data$Date,data$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

# save the plot to a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
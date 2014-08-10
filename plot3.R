# read data from the dates 2007-02-01 and 2007-02-02
data <- read.csv.sql("./household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

# concatenate date and time
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# plot
plot3 <- plot(data$Date,data$Sub_metering_1,type="l", xlab="",ylab="Energy sub metering")
lines(data$Date,data$Sub_metering_2,type="l",col="Red")
lines(data$Date,data$Sub_metering_3,type="l",col="Blue")
legend("topright",lty=1,col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# save the plot to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
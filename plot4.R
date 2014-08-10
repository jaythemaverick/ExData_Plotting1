# read data from the dates 2007-02-01 and 2007-02-02
data <- read.csv.sql("./household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

# concatenate date and time
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# plot
plot4 <- par(mfrow = c(2, 2))
with(data, {
        plot(Date,Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
        plot(Date,Voltage,type="l",xlab="datetime",ylab = "Voltage")
        plot(Date,Sub_metering_1,type="l", xlab="",ylab="Energy sub metering")
        lines(Date,Sub_metering_2,type="l",col="Red")
        lines(Date,Sub_metering_3,type="l",col="Blue")
        legend("topright",lty=1,bty="n",col = c("black","blue","red"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),xjust=1,cex=1)
        plot(Date,Global_reactive_power,type="l",xlab="datetime")
})

# save the plot to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
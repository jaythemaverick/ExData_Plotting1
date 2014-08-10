# read data from the dates 2007-02-01 and 2007-02-02
data <- read.csv.sql("./household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

# plot histogram
hist <- hist(data$Global_active_power, breaks = 12, xlim = range(0:6), ylim = range(0:1200))
plot1 <- plot(hist, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

# save the plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
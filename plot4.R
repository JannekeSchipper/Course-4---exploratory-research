dataFile <- "./Data/Course 4 - exploratory research/Week 1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subDataSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Transforming the Date and Time vars
subDataSet$datetime <- strptime(paste(subDataSet$Date, subDataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subDataSet$Sub_metering_1 <- as.numeric(subDataSet$Sub_metering_1)
subDataSet$Sub_metering_2 <- as.numeric(subDataSet$Sub_metering_2)
subDataSet$Sub_metering_3 <- as.numeric(subDataSet$Sub_metering_3)
subDataSet$Voltage <- as.numeric(subDataSet$Voltage)

par(mfrow = c(2,2))

#plot 1
plot(subDataSet$datetime, globalActivePower, type = "l", xlab="", ylab="Global Active Power")
#plot 2
plot(subDataSet$datetime, subDataSet$Voltage, type = "l", xlab="datetime", ylab="Voltage")
#plot 3
plot(subDataSet$datetime, subDataSet$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
with(subDataSet, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(subDataSet, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=1, lwd=2.5, bty="n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot 4
plot(subDataSet$datetime, subDataSet$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, width=480, height=480, file = "plot4.png")
dev.off()




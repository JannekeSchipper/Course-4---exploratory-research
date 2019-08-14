dataFile <- "./Data/Course 4 - exploratory research/Week 1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subDataSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Transforming the Date and Time vars
subDataSet$datetime <- strptime(paste(subDataSet$Date, subDataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subDataSet$Sub_metering_1 <- as.numeric(subDataSet$Sub_metering_1)
subDataSet$Sub_metering_2 <- as.numeric(subDataSet$Sub_metering_2)
subDataSet$Sub_metering_3 <- as.numeric(subDataSet$Sub_metering_3)

par(mfrow = c(1,1))
Sys.setlocale("LC_ALL", "English")
plot(subDataSet$datetime, subDataSet$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
with(subDataSet, lines(datetime, Sub_metering_2, col = "red"))
with(subDataSet, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, width=480, height=480, file = "plot8.png")
dev.off()



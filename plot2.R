dataFile <- "./Data/Course 4 - exploratory research/Week 1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subDataSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Transforming the Date and Time vars
subDataSet$datetime <- strptime(paste(subDataSet$Date, subDataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subDataSet$globalActivePower <- as.numeric(subDataSet$Global_active_power)

Sys.setlocale("LC_ALL", "English")
plot(subDataSet$datetime, subDataSet$globalActivePower, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, width=480, height=480, file = "plot2.png")
dev.off()

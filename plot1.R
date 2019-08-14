dataFile <- "./Data/Course 4 - exploratory research/Week 1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subDataSet <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

globalActivePower <- as.numeric(subDataSet$Global_active_power)

hist(globalActivePower, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, width=480, height=480, file = "plot1.png")
dev.off()







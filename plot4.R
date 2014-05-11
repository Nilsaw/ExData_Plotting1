# plot4.R

# Read data
data <- read.table('household_power_consumption.txt', sep=';', header=T, colClasses = c('character', 'character', 'numeric',
                                                                                        'numeric', 'numeric', 'numeric',
                                                                                        'numeric', 'numeric', 'numeric'),na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Subsetting to the dates 2007-02-01 and 2007-02-02
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# Saving plot4.png
png("plot4.png", height=480, width=480)

# Generating histogram

#Dividing the image to show multiple (4) histograms
par(mfrow=c(2,2))

# Taking previous solutions into consideration 

# 1
plot(data$DateTime, data$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# 2
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(data$DateTime, data$Voltage)

# 3
plot(data$DateTime, data$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'),bty = 'n')

# 4
with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))

#Closing file
dev.off()
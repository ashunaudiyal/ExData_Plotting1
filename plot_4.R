x <- read.table("C:\\Users\\ASHU\\Desktop\\Ashu\\Coursera Courses\\Data Science Using R - Specialization\\Working Material\\CSV Files\\household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

## Create column in table with date and time merged together
z <- strptime(paste(x$Date, x$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
x <- cbind(x, z)

## setting classes
x$Date <- as.Date(x$Date, format="%d/%m/%Y")
x$Time <- format(x$Time, format="%H:%M:%S")
x$Global_active_power <- as.numeric(x$Global_active_power)
x$Global_reactive_power <- as.numeric(x$Global_reactive_power)
x$Voltage <- as.numeric(x$Voltage)
x$Global_intensity <- as.numeric(x$Global_intensity)
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3)

##subsetting required data
y <- subset(x, Date == "2007-02-01" | Date =="2007-02-02")

## creating plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(y, plot(z, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(y, plot(z, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(y, plot(z, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(y$z, y$Sub_metering_2,type="l", col= "red")
lines(y$z, y$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(y, plot(z, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
## reading data
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

## creating plot1
png("plot2.png", width=480, height=480)
with(y, plot(z, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()

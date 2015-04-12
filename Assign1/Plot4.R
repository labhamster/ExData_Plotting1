## Read file

hsehld_power <- file("household_power_consumption.txt")

## Sort file
hsehld_power_consump <- read.table(text = grep("^[1,2]/2/2007", readLines(hsehld_power), value = TRUE), col.names =
                     c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_int
 ensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE
)

datetime <- strptime(paste(hsehld_power_consump$Date, hsehld_power_consump$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
voltage <- as.numeric(hsehld_power_consump$Voltage)
subMetering1 <- as.numeric(hsehld_power_consump$Sub_metering_1)
subMetering2 <- as.numeric(hsehld_power_consump$Sub_metering_2)
subMetering3 <- as.numeric(hsehld_power_consump$Sub_metering_3)
global_ActivePower <- as.numeric(hsehld_power_consump$Global_active_power)
global_ReactivePower <- as.numeric(hsehld_power_consump$Global_reactive_power)



# Plot 4:



png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, voltage, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, global_ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

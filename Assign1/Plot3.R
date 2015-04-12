## Read file

hsehld_power <- file("household_power_consumption.txt")

## Sort file
hsehld_power_consump <- read.table(text = grep("^[1,2]/2/2007", readLines(hsehld_power), value = TRUE), col.names =
                                       c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_int
 ensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE
)
datetime <- strptime(paste(hsehld_power_consump$Date, hsehld_power_consump$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(hsehld_power_consump$Global_active_power)

Sub_Metering1 <- as.numeric(hsehld_power_consump$Sub_metering_1)
Sub_Metering2 <- as.numeric(hsehld_power_consump$Sub_metering_2)
Sub_Metering3 <- as.numeric(hsehld_power_consump$Sub_metering_3)

##Write PNG


png(filename="plot3.png", width=480, height=480)


# Plot 3:


plot(datetime, Sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_Metering2, type="l", col="red")
lines(datetime, Sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))



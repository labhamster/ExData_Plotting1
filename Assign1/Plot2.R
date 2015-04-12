## Read file

hsehld_power <- file("household_power_consumption.txt")

## Sort file
hsehld_power_consump <- read.table(text = grep("^[1,2]/2/2007", readLines(hsehld_power), value = TRUE), col.names =
                     c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_int
 ensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE
)
datetime <- strptime(paste(hsehld_power_consump$Date, hsehld_power_consump$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(hsehld_power_consump$Global_active_power)

##Write PNG

png(filename="plot2.png", width=480, height=480)
# Plot 2: Type 1


plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")



dev.off()

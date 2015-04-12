## Read file

hsehld_power <- file("household_power_consumption.txt")

## Sort file
hsehld_power_consump <- read.table(text = grep("^[1,2]/2/2007", readLines(hsehld_power), value = TRUE), col.names =
                     c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_int
 ensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE
)


##Write PNG
png(filename="plot1.png", width=480, height=480)
##plotting

##Plot 1: Histogram
hist(hsehld_power_consump$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Powr (kilowatts)")


dev.off()

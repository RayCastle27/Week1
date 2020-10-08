library(sqldf)
f <- file("E:/household_power_consumption.txt")
measurements <- 
  sqldf("select * from  f where Date = '1/2/2007' or Date = '2/2/2007'", 
        dbname = tempfile(), 
        file.format = list(header = TRUE, row.names = FALSE, sep = ";"))
close(f)
library(lubridate)
measurements$datetime <- dmy_hms(paste(measurements$Date, measurements$Time))
png(filename = "E:/plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2), mar = c(4, 4, 3, 2))
with(measurements, {
plot(datetime,
     Global_active_power, type = "l",ylab = "Global Active Power",xlab = "")
plot(datetime,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "")
lines(datetime,Sub_metering_2, type = "l",col = "red")
lines(datetime,Sub_metering_3, type = "l",col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       bty = "n")
plot(datetime,Voltage, type = "l",ylab = "Voltage")
plot(datetime,
     Global_reactive_power, 
     type = "l")
})


dev.off()
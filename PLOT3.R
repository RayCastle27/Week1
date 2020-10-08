library(sqldf)
f <- file("E:/household_power_consumption.txt")
measurements <- 
  sqldf("select * from  f where Date = '1/2/2007' or Date = '2/2/2007'", 
        dbname = tempfile(), 
        file.format = list(header = TRUE, row.names = FALSE, sep = ";"))
close(f)
library(lubridate)
measurements$DateTime <- dmy_hms(paste(measurements$Date, measurements$Time))
png(filename = "E:/plot3.png", width = 480, height = 480, units = "px")
with(measurements, {
  plot(DateTime,Sub_metering_1, type = "l",ylab = "Energy sub metering",xlab = "")
  lines(DateTime,Sub_metering_2,type = "l",col = "red")
  lines(DateTime,Sub_metering_3,type = "l",col = "blue")
  legend("topright", 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"),
         lty = c(1, 1, 1))
})

dev.off()
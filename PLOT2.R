library(sqldf)
f <- file("E:/household_power_consumption.txt")
measurements <- 
  sqldf("select * from  f where Date = '1/2/2007' or Date = '2/2/2007'", 
        dbname = tempfile(), 
        file.format = list(header = TRUE, row.names = FALSE, sep = ";"))
close(f)
library(lubridate)
measurements$DateTime <- dmy_hms(paste(measurements$Date, measurements$Time))
png(filename = "E:/plot2.png", 
    width = 480, 
    height = 480, 
    units = "px")
plot(measurements$DateTime,
     measurements$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()
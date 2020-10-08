library(sqldf)
f <- file("E:/household_power_consumption.txt")
measurements <- 
  sqldf("select * from  f where Date = '1/2/2007' or Date = '2/2/2007'", 
        dbname = tempfile(), 
        file.format = list(header = TRUE, row.names = FALSE, sep = ";"))
close(f)
png(filename = "E:/plot1.png", width = 400, height = 400, units = "px")
hist(measurements$Global_active_power, 
     col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

library(sqldf)
library(lubridate)

#Store filename.
fn <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
DF4 <- read.csv.sql(fn, sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep=";")

#Concatenate date and time.
newDate <- paste(DF4$Date, DF4$Time)
newDate <- dmy_hms(newDate)
DF4$Date <- newDate

png("plot3.png")

with(DF4, plot(DF4$Date, DF4$Sub_metering_1, 
               type="l", ylim=c(0,40),  xlab="", ylab="Energy sub metering"))

with(DF4, lines(DF4$Date, DF4$Sub_metering_2, 
                ylim=c(0,40), xlab="", col="red"))

with(DF4, lines(DF4$Date, DF4$Sub_metering_3, 
                ylim=c(0,40), xlab="", col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

dev.off()

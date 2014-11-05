library(sqldf)
library(lubridate)

#Store filename.
fn <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
DF4 <- read.csv.sql(fn, sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep=";")

#Concatenate date and time.
newDate <- paste(DF4$Date, DF4$Time)
newDate <- dmy_hms(newDate)
DF4$Date <- newDate


png("plot4.png")

par(mfrow=c(2,2))

#Plot 1, top left
with(DF4, plot(DF4$Date, DF4$Global_active_power, 
               type="l", xlab="", ylab="Global Active Power"))

#Plot 2 top right
with(DF4, plot(DF4$Date, DF4$Voltage, ylim=c(234,246), type="l", xlab="datetime", ylab="Voltage" ))

#Plot 3 bottom left
with(DF4, plot(DF4$Date, DF4$Sub_metering_1, 
               type="l", ylim=c(0,40),  xlab="", ylab="Energy sub metering"))

with(DF4, lines(DF4$Date, DF4$Sub_metering_2, 
                ylim=c(0,40), xlab="", col="red"))

with(DF4, lines(DF4$Date, DF4$Sub_metering_3, 
                ylim=c(0,40), xlab="", col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, border="")

#Plot 4 bottom right
with(DF4, plot(DF4$Date, DF4$Global_reactive_power, ylim=c(0.0,0.5), 
               type="l", xlab="datetime", ylab="Global_reactive_power" ))

dev.off()

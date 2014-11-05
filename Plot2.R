library(sqldf)
library(lubridate)

# Store the filename of the datafile.
fn <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

# Read data only for given dates.
DF4 <- read.csv.sql(fn, sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep=";")

# Concatenate date and time.
newDate <- paste(DF4$Date, DF4$Time)
newDate <- dmy_hms(newDate)
DF4$Date <- newDate

png("plot2.png")

with(DF4, plot(DF4$Date, DF4$Global_active_power, 
               type="l", xlab="", ylab="Global Active Power (Kilowatts)"))
dev.off()

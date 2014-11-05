## SQL package is quite handy for selective reading.

library(sqldf)

## store the filename relative to present working directory.
fn <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

## Only read data for given two dates.
DF4 <- read.csv.sql(fn, sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep=";")

## Store the plot in a file in working directory.
png("plot1.png")
hist(DF4$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


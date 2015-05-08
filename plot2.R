##Set Working Directory to where 'household_power_consumption.txt' is located
#Read data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Subset the dates 2007-02-01 and 2007-02-02 from data
subDat <-  subset(dat, dat$Date %in% c('1/2/2007', '2/2/2007'), select = Date:Sub_metering_3)
#Convert Date and Time variables to Date/Time classes in R using strptime()
x <- paste(subDat$Date, subDat$Time)
dates <- strptime(x, "%d/%m/%Y %H:%M:%S")
#Convert 'dates' to POSIXct
#because `mutate` does not support `POSIXlt` results
datesCon <- as.POSIXct(dates)
#Load 'dplyr' library
library(dplyr)
#Add new 'DateTime' column to data
full <- mutate(part, DateTime = datesCon)

#Open png device to save file in working directory
png("plot2.png", width = 480, height = 480, units = "px")
# Create plot and send to png file 
plot(full$DateTime, full$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#Close png file device
dev.off()  

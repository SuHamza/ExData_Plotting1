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
png("plot3.png", width = 480, height = 480, units = "px")
# Create plot and send to png file 
plot(full$DateTime, full$Sub_metering_1, 
     type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(full$DateTime, full$Sub_metering_2, col = "red")
lines(full$DateTime, full$Sub_metering_3, col = "blue")
#Add legend to plot
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close png file device
dev.off()  

##Set Working Directory to where 'household_power_consumption.txt' is located
#Read data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Subset the dates 2007-02-01 and 2007-02-02 from data
subDat <-  subset(dat, dat$Date %in% c('1/2/2007', '2/2/2007'), select = Date:Sub_metering_3)
#Open png device to save file in working directory
png("plot1.png", width = 480, height = 480, units = "px")
#Draw Histogram
hist(subDat$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

#Close png file device
dev.off()  

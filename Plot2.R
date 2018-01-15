###Read the data that was downloaded from the assignment.

power <- read.table('household_power_consumption.txt',sep=';',header=TRUE)
###Make sure the data is in the correct class for plotting.  Use the lubridate package to work with dates
library(lubridate)
power$Date = dmy(power$Date)



power$Global_active_power = as.numeric(power$Global_active_power)


###Subset by the dates "2007-02-01" and "2007-02-02"

relPower = subset(power, Date == '2007-02-01' | Date == '2007-02-02')

relPower$day<- wday(relPower$Date,label=TRUE)

relPower$nDate <- relPower$Date+ hms(relPower$Time)
###Creates a plot frame with the desired x and y axii
with(relPower, plot(nDate,Global_active_power, type='n', 
                    
                    xlab='', ylab='Global Active Power (kilowatts)'))
###Fills in the plot with data
lines(relPower$nDate,relPower$Global_active_power)

###Copy plot to png file
dev.copy(png, file="plot2.png")
dev.off()






#################


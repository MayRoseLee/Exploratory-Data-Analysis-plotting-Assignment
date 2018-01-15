
###Read in the data from "household_power_consumption.txt", downloaded from assignment page into the working directory
power = read.table('household_power_consumption.txt',sep=';',header=TRUE)
### Use lubridate package to work with dates.  Convert factor variables to numeric.
library(lubridate)
power$Date = dmy(power$Date)



power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)



power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
###Subset by desired dates
datePower = subset(power, Date == '2007-02-01' | Date == '2007-02-02')
###Create variables for x-axis
datePower$day = wday(datePower$Date,label=TRUE)
###Use dates and times combined for plot
datePower$nDate = datePower$Date+ hms(datePower$Time)

###Create new x-axis variable
relPower$datetime <- relPower$Date+ hms(relPower$Time)
###Creates a plot frame with the desired x and y axii
 with(relPower, plot( nDate,Sub_metering_1, type="l",col="black", ylab='Energy sub metering'))
###Fills in the plot with data


  plot(relPower,nDate, Sub_metering_1, type= "l", col="black", ylab= "Energy sub metering"
       )
         
###Add the second curve 
 with(relPower,lines(nDate,Sub_metering_2, type="l", col = "red"))
###Add the third curve
with(relPower, lines( nDate, Sub_metering_3, type="l", col="blue"))


###Add a legend
legend("topright",pch ="___", col = c("black","red","blue"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )



###Save the plot to a PNG file.
dev.copy(png, file="plot3.png")
dev.off()


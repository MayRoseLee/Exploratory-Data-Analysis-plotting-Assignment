###Read in the data "household_power_consumption.txt", located in the working directory.
power = read.table('household_power_consumption.txt',sep=';',header=TRUE)
### Use the dplyr and lubridate packages
library(dplyr)
library(lubridate)
### format the Date
power$Date = dmy(power$Date)
###rewrite factor variables as numeric
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)

power$Global_active_power = as.numeric(power$Global_active_power)
power$Voltage <- as.numerictype(power$Voltage)

power$Sub_metering_1<- as.numeric(power$Sub_metering_1)

power$Sub_metering_2<- as.numeric(power$Sub_metering_2)

power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
###Subset the data to include only the two dates desired

relPower <- subset(power, Date == '2007-02-01' | Date == '2007-02-02')



###Create a new Date and time variable
relPower$datetime = relPower$Date+ hms(relPower$Time)
### Create a variable for weekday
relPower$day = wday(relPower$Date,label=TRUE)



###Set up for a screen that contains 4 plots--2 rows, 2 columns.Specify the plot sizes.
par(mfrow= c(2,2),mar= c(4,4, 2, 1),oma=c(0,0,.5,0))
###Create plot(1,1)


relPower$nDate <- relPower$Date+ hms(relPower$Time)
###Creates a plot frame with the desired x and y axii
with(relPower, plot(nDate,Global_active_power, type='n', 
                    
                    xlab='', ylab='Global Active Power '))
###Fills in the plot with data
lines(relPower$nDate,relPower$Global_active_power)

###Create plot(1,2)
with(relPower, plot(nDate,Voltage, type='n', 
                    
                    xlab='datetime', ylab='Voltage'))
###Fills in the plot with data
lines(relPower$nDate,relPower$Voltage)       

###Create plot (2,1)
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

###  Create plot (2,2)
###Creates a plot frame with the desired x and y axii
with(relPower, plot(nDate,Global_reactive_power, type='n', xlab='datetime' ))
###Fills in the plot with data
lines(relPower$nDate,relPower$Global_reactive_power, type='l')

###Save the plot to a PNG file.
dev.copy(png, file="plot4.png")
dev.off()

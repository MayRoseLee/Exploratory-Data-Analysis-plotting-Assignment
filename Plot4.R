###Read in the data "household_power_consumption.txt", located in the working directory.
electricity <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

###Use dplyr pckage
library(dplyr)
###Read in the Date as a Date class variable
elecDate <- mutate(electricity, date= as.Date(Date, format="%d/%m/%Y"))

### date is in the Date format.  Use date in the analysis.
###Subset the dataset to include only dates from 2007-02-01 to 2007-02-02.
Date1<- "2007-02-01"
Date2 <- "2007-02-02"

elecYear <- filter(elecDate,(date == Date1 | date == Date2))
###Examine the dataset which contains 2880 observations.
head(elecYear)
dim(elecYear)
###Set up for a screen that contains 4 plots--2 rows, 2 columns.Specify the plot sizes.
par(mfrow= c(2,2),mar= c(4,4, 2, 1),oma=c(0,0,2,0))
 
### Plot datetime vs Global Active Power,plot (1,1)
### Create data for x-axis
datetime <- strptime(elecYear$Time,format="%H:%M:%S")
###Plot datetime vs Global_active_power
 plot(datetime, elecYear$Global_active_power, type= "l", col="black",
      ylab= "Global Active Power ", xaxt='n')
###Labels for x-axis 
  
###Plot (1,2) 
 axis(side=1, at=c(2,50, 95), labels=c("Thu", "Fri","Sat"))
 ###Plot datetime vs Voltage
 plot(datetime, elecYear$Voltage, type= "l", col="black",
      ylab= "Voltage", xaxt='n')
 ###Labels for x-axis 
 
   
   axis(side=1, at=c(2,50, 95), labels=c("Thu", "Fri","Sat")) 
### Plot Energy sub metering plot(2,1)
 ###Plot datetime vs Sub_metering_(1,2, 3)
 datetime <- strptime(elecYear$Time, format="%H:%M:%S")
 Sub_metering_1<-elecYear$Sub_metering_1
 Sub_metering_2<-elecYear$Sub_metering_2
 Sub_metering_3 <- elecYear$Sub_metering_3
 ###Draw the initial plot
 plot(datetime,Sub_metering_1, type= "l", col="black", ylab= "Energy sub metering",xaxt='n')
 
 ###Add the second curve 
 lines(xdata,Sub_metering_2, type="l", col = "red",xact='n')
 ###Add the third curve
 lines(xdata, Sub_metering_3, type="l", col="blue", xact='n')
 
 ###Add a legend
 legend("topright",pch ="___", col = c("black", "red", "blue"),legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
 )

head(elecYear)

###plot datetime vsGlobal_reactive _power,  plot(2,2)
plot(datetime,elecYear$Global_reactive_power, type= "l",ylab="Global_reactive_power", col="black")


###Save the plot to a PNG file.
dev.copy(png, file="plot4.png")
dev.off()


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
 ###Plot datetime vs Sub_metering_(1,2, 3)
datetime <- strptime(elecYear$Time, format="%H:%M:%S")
Sub_metering_1<-elecYear$Sub_metering_1
Sub_metering_2<-elecYear$Sub_metering_2
Sub_metering_3 <- elecYear$Sub_metering_3
###Draw the initial plot
  plot(datetime,Sub_metering_1, type= "l", col="black", ylab= "Energy sub metering")
         
###Add the second curve 
 lines(datetime,Sub_metering_2, type="l", col = "red")
###Add the third curve
lines(datetime, Sub_metering_3, type="l", col="blue")

###Add a legend
legend("topright",pch ="___", col = c("black", "red", "blue"),legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       )



###Save the plot to a PNG file.
dev.copy(png, file="plot3.png")
dev.off()


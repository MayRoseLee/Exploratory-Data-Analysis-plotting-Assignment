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
### Create data for x-axis
datetime <- strptime(elecYear$Time,format="%H:%M:%S")
###Plot xdata vs Global_active_power
 plot(datetime, elecYear$Global_active_power, type= "l", col="black",
      ylab= "Global Active Power (kilowatts)",xaxt='n' )
###Labels for x-axis 

 
 axis(side=1, at=x, labels=c("Thu", "Fri","Sat"))
      

 

###Save the plot to a PNG file.
dev.copy(png, file="plot1.png")
dev.off()


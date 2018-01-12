electricity <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
names(electricity)

head(electricity)
 
###Subset the dataset to include only dates from 2007-02-01 to 2007-02-02.


### This code returns 0 observations.Suspect that the desired dates are not there. Use Viewtable to
check.
### Subset the data for year 2007
##elec2007 <- filter(electricity, year(date)== "2007")
elecYear <- subset(electricity, dmy(date)=="02-01-2007"|dmy(date)=="02-02-2007")
###Subset the dataset to include only dates from 2007-02-01 to 2007-02-02.  Looking at the View()
###for the electricity data, These dates were in rows 23437 to 24876.
### Read in the selected lines.
###electricDate <- electricity[23437:24876, ]
###Use dplyr pckage
library(dplyr)
elecDate <- mutate(electricity, date= as.Date(Date, format="%d/%m/%Y"),datetime=strptime(Time,format = "%h:%m:%s"))
head(elecDate)
### date is in the Date format.  Use date in the analysis.
###
###
names(elecDate)
str(elecDate)

Date1<- "2007-02-01"
Date2 <- "2007-02-02"

elecYear <- filter(elecDate,(date == Date1 | date == Date2))
###Examine the dataset
head(elecYear)
dim(elecYear)
###Plot a histogram of Global Active Power

hist(electricYear$Global_active_power, col ="red", xlab= "Global Active Power (kilowatts)")
### An error message is returned, because the object must be numeric.Check if Global_active_power is numeric
###class(electricDates$Global_active_power)
### Global_active_power is a factor. Make it numeric.
Global_active_power <-as.numeric(elecYear$Global_active_power)
### Check if numeric
class(elecYear$Global_active_power)
hist(Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
###Save the plot to a PNG file.
dev.copy(png, file="plot1.png")
dev.off()


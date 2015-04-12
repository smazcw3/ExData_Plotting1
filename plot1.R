##Reading the dataset
dt <- read.csv("household_power_consumption.txt", header=T ,sep=";", check.names=F, nrows=2075259, comment.char="", na.strings="?", stringsAsFactors=F, quote='\"')
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

##Subsetting the dataset from dates 2007-02-01 and 2007-02-02
sub_data <- subset(dt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Coverting the date and time variables into date/time classes
date_time <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(date_time)

##Plot the Histogram
hist(sub_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")

##Save the plot to file device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off() ##close the file device


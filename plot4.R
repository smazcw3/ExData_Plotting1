##Reading the dataset
dt <- read.csv("household_power_consumption.txt", header=T ,sep=";", check.names=F, nrows=2075259, comment.char="", na.strings="?", stringsAsFactors=F, quote='\"')
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

##Subsetting the dataset from dates 2007-02-01 and 2007-02-02
sub_data <- subset(dt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Coverting the date and time variables into date/time classes
date_time <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(date_time)

par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(sub_data,{
	plot(Global_active_power~Datetime, type="l", 
		ylab="Global Active Power", xlab="")
	plot(Voltage~Datetime, type="l", 
		ylab="Voltage", xlab="datetime")
	plot(Sub_metering_1~Datetime, type="l", 
		ylab="Energy sub metering", xlab="")
	lines(Sub_metering_2~Datetime, col='Red')
	lines(Sub_metering_3~Datetime, col='Blue')
	legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(Global_reactive_power~Datetime, type="l", 
		ylab="Global_reactive_power", xlab="datetime")
})

##Save the plot to file device
dev.copy(png, "plot4.png", height=480, width=480)
dev.off()  ##close the file device
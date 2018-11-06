library(dplyr)
library(lubridate)


#read table from the downloaded file 
power <- read.table("./household_power_consumption.txt",stringsAsFactors = FALSE, header=TRUE,sep=";")

#use lubridate package to merge data and time into a new column named"date_time" 
power$date_time <- dmy_hms(paste(power$Date,power$Time))

#use lubridate package to change Date column as Date class
power$Date <- dmy(power$Date)

#use lubridate package to change Time column as time class
power$Time <- hms(power$Time)


#use dplyr package to change column 3 to 8 to numeric
id = 3:8
power[id] <- data.matrix(power[id])

#select data from the dates of 2007-02-01 and 2007-02-02
power2007 <- subset(power,Date =="2007-02-01" | Date =="2007-02-02")

#create plot4.png as 4 plots in one file

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#plot 1
with(power2007,plot(date_time, Global_active_power,type="l",xlab="",ylab="Global Active Power"))

#plot 2 
with(power2007,plot(date_time, Voltage,type="l",xlab="datetime",ylab="Voltage"))

#plot 3
with(power2007,plot(date_time, Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(power2007$date_time, power2007$Sub_metering_2,col="red")
lines(power2007$date_time, power2007$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")

#plot 4
with(power2007,plot(date_time, Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()
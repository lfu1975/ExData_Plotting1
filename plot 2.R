library(dplyr)
library(lubridate)

#read table from the download file
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

#create plot2.png as scatter plot with lines
png("plot2.png", width=480, height=480)
with(power2007,plot(date_time, Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowalts)"))
dev.off()
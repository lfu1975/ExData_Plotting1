library(dplyr)
library(lubridate)

#read table from the download file
power <- read.table("./household_power_consumption.txt",stringsAsFactors = FALSE, header=TRUE,sep=";")

#use lubridate package to change Date column as Date class
power$Date <- dmy(power$Date)

#use dplyr package to change column 3 to 8 as numeric
id = 3:8
power[id] <- data.matrix(power[id])

#select data from the dates of 2007-02-01 and 2007-02-02
power2007 <- subset(power,Date =="2007-02-01" | Date =="2007-02-02"

#creat plot1.png as histogram figure
png("plot1.png", width=480, height=480)
hist(power2007$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
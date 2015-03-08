setInternet2(use=TRUE)
library(lubridate)
library(dplyr)
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataurl,destfile="powerdata.zip")
unzip("powerdata.zip")
mydf<- read.table("household_power_consumption.txt",sep=";")
mydff <- tbl_df(mydf)
newdff <-filter(mydff, V1== "1/2/2007" | V1=="2/2/2007")
yvalues <- as.numeric(as.character(newdff$V3))
subm1<-as.numeric(as.character(newdff$V7))
subm2<-as.numeric(as.character(newdff$V8))
subm3<-as.numeric(as.character(newdff$V9))

mydate <- as.Date(as.character(newdff$V1),format="%d/%m/%Y")
date_time<-paste(mydate,newdff$V2) 
png(file="plot4.png")
xxval<-as.POSIXct(date_time)
par(mfrow=c(2,2))
plot(xxval,yvalues,ylab="Global Active Power(kilowatts)", xlab="",main= "Global Active ive Power",type="l")
voltage <- as.numeric(as.character(newdff$V5))
plot(xxval,voltage,ylab="Voltage", xlab="datetime",main= "",type="l")

plot(xxval,subm1,ylab="Energy sub metering", xlab="",main= "",type="l")
lines(xxval,subm2, col="red")
lines(xxval, subm3, col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

gblreactive <- as.numeric(as.character(newdff$V4))
plot(xxval,gblreactive,ylab="Global_reactive_Power", xlab="datetime",main= "",type="l")


dev.off()


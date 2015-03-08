library(lubridate)
library(dplyr)
setInternet2(use=TRUE)
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataurl,destfile="powerdata.zip")
unzip("powerdata.zip")
mydf<- read.table("household_power_consumption.txt",sep=";")
mydff <- tbl_df(mydf)
newdff <-filter(mydff, V1== "1/2/2007" | V1=="2/2/2007")

subm1<-as.numeric(as.character(newdff$V7))
subm2<-as.numeric(as.character(newdff$V8))
subm3<-as.numeric(as.character(newdff$V9))

mydate <- as.Date(as.character(newdff$V1),format="%d/%m/%Y")
date_time<-paste(mydate,newdff$V2) 
png(file="plot3.png")
xxval<-as.POSIXct(date_time)
plot(xxval,subm1,ylab="Energy sub metering", xlab="",main= "",type="l")
lines(xxval,subm2, col="red")
lines(xxval, subm3, col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=20)
dev.off()


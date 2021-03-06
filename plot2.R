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
mydate <- as.Date(as.character(newdff$V1),format="%d/%m/%Y")
date_time<-paste(mydate,newdff$V2) 
png(file="plot2.png")
xxval<-as.POSIXct(date_time)
plot(xxval,yvalues,ylab="Global Active Power(kilowatts)", xlab="",main= "Global Active Power",type="l")
dev.off()


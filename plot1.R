library(lubridate)
library(dplyr)
setInternet2(use=TRUE)
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataurl,destfile="powerdata.zip")
unzip("powerdata.zip")
mydf<- read.table("household_power_consumption.txt",sep=";")
mydff <- tbl_df(mydf)
newdff <-filter(mydff, V1== "1/2/2007" | V1=="2/2/2007")
myvalues <- as.numeric(as.character(newdff$V3))
png(file="plot1.png")
hist(myvalues,xlab="Global Active Power(kilowatts)", main= "Global Active Power",col="red")
dev.off()


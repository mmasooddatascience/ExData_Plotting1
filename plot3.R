#setwd("C:\\Projects\\Personal\\DataScience\\Exploratry Data Analysis\\Assignment 1")
#source("./plot3.R")

#load data
data <- read.table("./Data/household_power_consumption.txt", header=TRUE, sep=";")

#su setting data
subsetData = subset(subsetData, as.Date(Date,"%d/%m/%Y") >= '2007-02-01' & as.Date(Date,"%d/%m/%Y") < '2007-02-03')

#converting data types
subsetData$Global_active_power = as.numeric(as.character(subsetData$Global_active_power))
subsetData$Sub_metering_1 = as.numeric(as.character(subsetData$Sub_metering_1))
subsetData$Sub_metering_2 = as.numeric(as.character(subsetData$Sub_metering_2))
subsetData$Sub_metering_3 = as.numeric(as.character(subsetData$Sub_metering_3))
subsetData$DateTime = strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S") 

#plotting graph
png("plot3.png", width = 480, height = 480)
plot(subsetData$DateTime, subsetData$Sub_metering_1,col="black",  type="l",ylab="Energy sub metering", xlab="")
lines(subsetData$DateTime, subsetData$Sub_metering_2,col="red")
lines(subsetData$DateTime, subsetData$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))
dev.off()
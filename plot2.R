#setwd("C:\\Projects\\Personal\\DataScience\\Exploratry Data Analysis\\Assignment 1")
#source("./plot2.R")

#load data
data <- read.table("./Data/household_power_consumption.txt", header=TRUE, sep=";")

#showing first 5 rows
#head(data, 5)

#handling missing value
missingValueIndices <- which(is.na(data$Date) == TRUE)
if(length(missingValueIndices) > 0){
  data <- data[-missingValueIndices, ]
}

missingValueIndices <- which(is.na(data$Global_active_power) == TRUE)
if(length(missingValueIndices) > 0){
  data <- data[-missingValueIndices, ]
}

#after checking the class of Data varibale
#class(data$Date)
#converting factor to date
#data$Date = as.Date(data$Date, "%d/%m/%Y")

#sub setting data
subsetData = subset(data, as.Date(data$Date,"%d/%m/%Y") >= '2007-02-01' & as.Date(data$Date,"%d/%m/%Y") < '2007-02-03')

#after checking the class of Global_active_power variable
#class(subsetData$Global_active_power)
#converting from factor to numeric
subsetData$Global_active_power = as.numeric(as.character(subsetData$Global_active_power))

#creating a new variable to hold both date and time
subsetData$DateTime = strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S") 

#plotting data
png("plot2.png", width = 480, height = 480)
plot(subsetData$DateTime, subsetData$Global_active_power,  type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
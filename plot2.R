getwd()
setwd('./R Studio/')
if(!file.exists("./data")){
  dir.create("./data")
}
plottingData <- read.table("data/household_power_consumption.txt",header=TRUE,sep = ";", na.strings = "?")

plottingData$Date <- as.Date(plottingData$Date, format="%d/%m/%Y")
plottingData <- plottingData[which(plottingData$Date>="2007-02-01"&plottingData$Date<="2007-02-02"),]
plottingData$time <- strptime(paste(plottingData$Date,plottingData$Time),format="%Y-%m-%d %H:%M:%S")

plot(plottingData$time,plottingData$Global_active_power, type = "l",ylab = "Global Active Power(kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()

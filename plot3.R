getwd()
setwd('./R Studio/')
if(!file.exists("./data")){
  dir.create("./data")
}
plottingData <- read.table("data/household_power_consumption.txt",header=TRUE,sep = ";", na.strings = "?")

plottingData$Date <- as.Date(plottingData$Date, format="%d/%m/%Y")
plottingData <- plottingData[which(plottingData$Date>="2007-02-01"&plottingData$Date<="2007-02-02"),]
plottingData$time <- strptime(paste(plottingData$Date,plottingData$Time),format="%Y-%m-%d %H:%M:%S")

plot(plottingData$time,plottingData$Sub_metering_1, type = "n",ylab = "Energy Sub metering")
points(plottingData$time,plottingData$Sub_metering_1, type="l")
points(plottingData$time,plottingData$Sub_metering_2, type="l", col="red")
points(plottingData$time,plottingData$Sub_metering_3, type="l", col="blue")

legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-")

dev.copy(png,file="plot3.png")
dev.off()

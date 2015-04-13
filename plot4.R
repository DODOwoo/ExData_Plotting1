getwd()
setwd('./R Studio/')
if(!file.exists("./data")){
  dir.create("./data")
}
plottingData <- read.table("data/household_power_consumption.txt",header=TRUE,sep = ";", na.strings = "?")

plottingData$Date <- as.Date(plottingData$Date, format="%d/%m/%Y")
plottingData <- plottingData[which(plottingData$Date>="2007-02-01"&plottingData$Date<="2007-02-02"),]
plottingData$time <- strptime(paste(plottingData$Date,plottingData$Time),format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
plot(plottingData$time,plottingData$Global_active_power, type = "l",ylab = "Global Active Power",xlab = "")
plot(plottingData$time,plottingData$Voltage, type = "l",ylab = "Voltage", xlab="datetime")

plot(plottingData$time,plottingData$Sub_metering_1, type = "n",ylab = "Energy Sub metering",xlab="")
points(plottingData$time,plottingData$Sub_metering_1, type="l")
points(plottingData$time,plottingData$Sub_metering_2, type="l", col="red")
points(plottingData$time,plottingData$Sub_metering_3, type="l", col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-",cex=0.5,bty = "n")

plot(plottingData$time,plottingData$Global_reactive_power, type = "l",ylab = "Global_reactive_power", xlab="datetime")

dev.copy(png,file="plot4.png")
dev.off()

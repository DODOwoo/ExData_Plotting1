getwd()
setwd('./R Studio/')
if(!file.exists("./data")){
  dir.create("./data")
}
plottingData <- read.table("data/household_power_consumption.txt",header=TRUE,sep = ";",na.strings = "?")

plottingData[,1] <- as.Date(plottingData[,1], format="%d/%m/%Y")
plottingData <- plottingData[which(plottingData$Date>="2007-02-01"&plottingData$Date<="2007-02-02"),]

hist(plottingData$Global_active_power ,col="red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")

dev.copy(png,file="plot1.png")
dev.off()
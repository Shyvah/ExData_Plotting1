
plotData <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## Setting Time Variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

## Plot 1
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Save file
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
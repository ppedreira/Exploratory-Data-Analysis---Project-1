
dataset<-read.table("household_power_consumption.txt",header= TRUE,sep= ";" )

period<- subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")

globalActivePower <- as.numeric(as.character(period$Global_active_power))

datetime <- strptime(paste(period$Date, period$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
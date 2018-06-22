dataset<-read.table("household_power_consumption.txt",header= TRUE,sep= ";" )

period<- subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")

datetime <- strptime(paste(period$Date, period$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot(1,1)
globalActivePower <- as.numeric(as.character(period$Global_active_power))


#Plot(1,2)
Voltage <- as.numeric(as.character(period$Voltage))

#Plot(2,1)
submet1 <- as.numeric(as.character(period$Sub_metering_1))
submet2 <- as.numeric(as.character(period$Sub_metering_2))
submet3 <- as.numeric(as.character(period$Sub_metering_3))

#plot(2,2)
globalReactivePower <- as.numeric(as.character(period$Global_reactive_power))

# Graphics

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#Plot(1,1)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Plot(1,2)
plot(datetime, Voltage, type="l", xlab="datatime", ylab="Voltage")

#Plot(2,1)
plot(datetime, submet1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, submet2, type="l", col = "red")
lines(datetime, submet3, type="l",col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty ="n")


#Plot(2,2)
plot(datetime, globalReactivePower, type="l", xlab="datatime", ylab="Global_reactive_power")



dev.off()
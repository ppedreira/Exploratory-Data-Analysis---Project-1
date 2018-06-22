dataset<-read.table("household_power_consumption.txt",header= TRUE,sep= ";" )

period<- subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")

submet1 <- as.numeric(as.character(period$Sub_metering_1))
submet2 <- as.numeric(as.character(period$Sub_metering_2))
submet3 <- as.numeric(as.character(period$Sub_metering_3))



datetime <- strptime(paste(period$Date, period$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png("plot3.png", width=480, height=480)
plot(datetime, submet1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, submet2, type="l", col = "red")
lines(datetime, submet3, type="l",col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue") )
dev.off()
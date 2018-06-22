#Read the dataset (2,075,259 rows and 9 columns)

dataset<-read.table("household_power_consumption.txt",header= TRUE,sep= ";" )
period<- subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")

globalActivePower <- as.numeric(as.character(period$Global_active_power))
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


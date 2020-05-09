data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= as.Date("01/02/2007","%d/%m/%Y") & data$Date <= as.Date("02/02/2007","%d/%m/%Y"),]
data$Global_active_power <- as.numeric(data$Global_active_power)


data$Date <- paste(data$Date,data$Time,sep=" ")
data$Date <- strptime(data$Date,"%Y-%m-%d %H:%M:%S")


png("plot4.png")
par(mfrow=c(2,2))
plot(data$Date, data$Global_active_power,type="l",ylab = "Global Active Power (kiowatts)",xlab="")

plot(data$Date, data$Voltage,type="l",ylab = "Voltage",xlab="datetime")

plot(data$Date,data$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")

plot(data$Date, data$Global_reactive_power,type="l",ylab = "Global_Reactive_Power",xlab="datetime")

dev.off()


data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= as.Date("01/02/2007","%d/%m/%Y") & data$Date <= as.Date("02/02/2007","%d/%m/%Y"),]
data$Global_active_power <- as.numeric(data$Global_active_power)


data$Date <- paste(data$Date,data$Time,sep=" ")
data$Date <- strptime(data$Date,"%Y-%m-%d %H:%M:%S")
png("plot3.png")
plot(data$Date,data$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2)

dev.off()




data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= as.Date("01/02/2007","%d/%m/%Y") & data$Date <= as.Date("02/02/2007","%d/%m/%Y"),]
data$Global_active_power <- as.numeric(data$Global_active_power)


data$Date <- paste(data$Date,data$Time,sep=" ")
data$Date <- strptime(data$Date,"%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(data$Date, data$Global_active_power,type="l",ylab = "Global Active Power (kiowatts)",xlab="")
dev.off()
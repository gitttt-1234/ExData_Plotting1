
data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= as.Date("01/02/2007","%d/%m/%Y") & data$Date <= as.Date("02/02/2007","%d/%m/%Y"),]
data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot1.png")
hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()




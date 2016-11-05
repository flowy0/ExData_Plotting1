data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

data1<- data
data1$Date<- as.Date(data1$Date, "%d/%m/%Y")
# data1$Time <-strptime(data1$Time, "%H:%M:%S" )

data1a <- subset(data1, Date >= "2007-02-01" & Date <= "2007-02-02")
data1a$Global_active_power<- as.numeric(data1a$Global_active_power)
data1a$DateTime <- as.POSIXct(paste(data1a$Date, data1a$Time))


png("plot3.png", width=480, height=480)
with(data1a, plot(DateTime, Sub_metering_1, 
                  type="l", xlab="",ylab="Energy sub metering"))

lines(data1a$DateTime, data1a$Sub_metering_2, col="red")
lines(data1a$DateTime, data1a$Sub_metering_3, col="blue")
axis(side=1, at=c(0,10,20,30))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


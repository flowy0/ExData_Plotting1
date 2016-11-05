data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

data1<- data
data1$Date<- as.Date(data1$Date, "%d/%m/%Y")
# data1$Time <-strptime(data1$Time, "%H:%M:%S" )

data1a <- subset(data1, Date >= "2007-02-01" & Date <= "2007-02-02")

data1a$Global_active_power<- as.numeric(data1a$Global_active_power)
data1a$DateTime <- paste(data1a$Date, data1a$Time)

data1a$DateTime1 <- as.POSIXct(data1a$DateTime)

png("plot2.png", width=480, height=480)
with(data1a, plot(DateTime1, Global_active_power/1000, 
                  type="l", xlab="",ylab="Global Active Power (kilowatts)"))

dev.off()


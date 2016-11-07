data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

data1<- data
data1$Date<- as.Date(data1$Date, "%d/%m/%Y")
# data1$Time <-strptime(data1$Time, "%H:%M:%S" )

data1a <- subset(data1, Date >= "2007-02-01" & Date <= "2007-02-02")

data1a$Global_active_power<- as.numeric(as.character(data1a$Global_active_power))

hist(data1a$Global_active_power, 
     col="red",
     main="Global Active Power", 
     xlab="Global Active Power(kilowatts)")
dev.copy(png, "plot1.png")
dev.off()



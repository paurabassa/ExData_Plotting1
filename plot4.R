 tb <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
tb$Date <- as.character(tb$Date)
tb$Time <- as.character(tb$Time)
tb$Full.Time <- strptime(paste(tb$Date,"-",tb$Time,sep=""),format="%d/%m/%Y-%H:%M:%S")
subset <-  (tb$Full.Time >  strptime("2007-02-01", format="%Y-%m-%d")
         & tb$Full.Time <  strptime("2007-02-03", format="%Y-%m-%d"))
tb2 <- tb[subset,]
head(tb2)

png("plot4.png")

par(mfrow = c(2, 2))
plot(tb2$Full.Time,tb2$Global_active_power,type="l", xlab="", 
     ylab="Global Active Power")

plot(tb2$Full.Time, tb2$Voltage, xlab="datetime", ylab="Voltage", type ="l", main="")

plot(tb2$Full.Time,tb2$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub matering")
lines(tb2$Full.Time,tb2$Sub_metering_2, col="red")
lines(tb2$Full.Time,tb2$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(tb2, plot(Full.Time,Global_reactive_power,xlab="datetime",type="l"))
dev.off()


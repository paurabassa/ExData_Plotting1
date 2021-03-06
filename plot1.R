 tb <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
tb$Date <- as.character(tb$Date)
tb$Time <- as.character(tb$Time)
tb$Full.Time <- strptime(paste(tb$Date,"-",tb$Time,sep=""),format="%d/%m/%Y-%H:%M:%S")
subset <-  (tb$Full.Time >  strptime("2007-02-01", format="%Y-%m-%d")
         & tb$Full.Time <  strptime("2007-02-03", format="%Y-%m-%d"))
tb2 <- tb[subset,]
head(tb2)

png("plot1.png")
hist(tb2$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
dev.off()


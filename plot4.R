plot4 <- function() {
   
   # load our CSV file (all data) 
   allData <- read.table("household_power_consumption.txt", header=TRUE, colClasses=c("character","character","double","double","double","double","double","double","double"),sep = ";",na.strings = "?")
   
   # filter only 2/1/2007 and 2/2/2007
   ourData <- allData[allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
   
   # convert date column to date class
   ourData$Date <- strptime(paste(ourData$Date, ourData$Time, sep=" " ), "%d/%m/%Y %H:%M:%S")
   
   # Ready our PNG output
   png(file="plot4.png", width=480, height=480)
   
   # setup 2 columns and two rows for plots
   par(mfcol = c(2,2))
   
   # Plot our line chart as chart 1
   plot(ourData$Date, ourData$Global_active_power, type="l", ylab="Global Active Power", xlab="")
   
   # Plot our multi-line chart as chart 2
   plot(ourData$Date, ourData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
   lines(ourData$Date, ourData$Sub_metering_2, col="red")
   lines(ourData$Date, ourData$Sub_metering_3, col="blue")
   legend("topright",col=c("black","red","blue"), cex =0.8, lty=1, bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
   
   # Plot line chart for Voltage as chart 3
   plot(ourData$Date, ourData$Voltage, type="l", ylab="Voltage", xlab="datetime")
   
   # Plot line chart for reactive power as chart 4
   plot(ourData$Date, ourData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
   
   # Write our charts to a PNG file
   dev.off()
}
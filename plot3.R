plot3 <- function() {
   
    # load our CSV file (all data) 
   allData <- read.table("household_power_consumption.txt", header=TRUE, colClasses=c("character","character","double","double","double","double","double","double","double"),sep = ";",na.strings = "?")
   
   # filter only 2/1/2007 and 2/2/2007
   ourData <- allData[allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
   
   # convert date column to date class
   ourData$Date <- strptime(paste(ourData$Date, ourData$Time, sep=" " ), "%d/%m/%Y %H:%M:%S")
   
   # Plot our histogram
   plot(ourData$Date, ourData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
   lines(ourData$Date, ourData$Sub_metering_2, col="red")
   lines(ourData$Date, ourData$Sub_metering_3, col="blue")
   legend("topright",col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
   
   
   # Write our histogram to a PNG file
   dev.copy(png, file="plot3.png", width=480, height=480)
   dev.off()
}
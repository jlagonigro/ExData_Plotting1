plot1 <- function() {
   
    # load our CSV file (all data) 
   allData <- read.table("household_power_consumption.txt", header=TRUE, colClasses=c("character","character","double","double","double","double","double","double","double"),sep = ";",na.strings = "?")
   
   # filter only 2/1/2007 and 2/2/2007
   ourData <- allData[allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
   
   # Plot our histogram
   hist(ourData$Global_active_power, col="red", main="Global Active Power", breaks=12, xlab="Global Active Power (kilowatts)")
   
   # Write our histogram to a PNG file
   dev.copy(png, file="plot1.png", width=480, height=480)
   dev.off()
}
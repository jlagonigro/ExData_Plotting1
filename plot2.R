plot2 <- function() {
   
    # load our CSV file (all data) 
   allData <- read.table("household_power_consumption.txt", header=TRUE, colClasses=c("character","character","double","double","double","double","double","double","double"),sep = ";",na.strings = "?")
   
   # filter only 2/1/2007 and 2/2/2007
   ourData <- allData[allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
   
   # convert date column to date class
   ourData$Date <- strptime(paste(ourData$Date, ourData$Time, sep=" " ), "%d/%m/%Y %H:%M:%S")
   
   # Plot our line chart
   plot(ourData$Date, ourData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
   
   # Write our line chart to a PNG file
   dev.copy(png, file="plot2.png", width=480, height=480)
   dev.off()
}
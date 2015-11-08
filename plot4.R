plot4 <- function() {
  
  #load raw data, replace "?" with "NA"
  rawdata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", blank.lines.skip=TRUE, row.names=NULL, dec=".", colClasses =NA, na.strings = c("","?","NA") )
  
  #get subset of data filtered by two days
  datefilter = c("1/2/2007", "2/2/2007")
  df <- subset(rawdata, Date %in% datefilter)
  ##df <- subset(rawdata, as.Date(Date, format='%d/%m/%Y') == "01/02/2007" | as.Date(Date, format='%d/%m/%Y') == "02/02/2007")
  
  #Add a new column Datetime to combine Date and Time
  df$Datetime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
  
  #save as png file
  png(file="plot4.png", width=480, height=480)
  
  #Plot 4 charts
  par(mfrow = c(2,2))
  
  plot(y = df$Global_active_power, x = df$Datetime, type = "l", main="", xlab = "", ylab = "Global Active Power")
  plot(y = df$Voltage, x = df$Datetime, type = "l", main="", xlab = "", ylab = "Voltage")
  
  plot(x = df$Datetime, y = df$Sub_metering_1, type = "l", main="", xlab = "", ylab = "Energy sub metering", col = "black")
  points(x = df$Datetime, y = df$Sub_metering_2, col='red', type='l')
  points(x = df$Datetime, y = df$Sub_metering_3, col='blue', type='l')
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1), bty = "n", cex = 0.8)
  
  plot(y = df$Global_reactive_power, x = df$Datetime, type = "l", main="", xlab = "", ylab = "Global_reactive_power")
  
  #close device
  dev.off()
}
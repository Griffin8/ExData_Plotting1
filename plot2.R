plot2 <- function() {

#load raw data, replace "?" with "NA"
rawdata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", blank.lines.skip=TRUE, row.names=NULL, dec=".", colClasses =NA, na.strings = c("","?","NA") )

#get subset of data filtered by two days
datefilter = c("1/2/2007", "2/2/2007")
df <- subset(rawdata, Date %in% datefilter)
##df <- subset(rawdata, as.Date(Date, format='%d/%m/%Y') == "01/02/2007" | as.Date(Date, format='%d/%m/%Y') == "02/02/2007")

#Add a new column Datetime to combine Date and Time
df$Datetime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

#save as png file
png(file="plot2.png", width=480, height=480)

#Plot
plot(y = df$Global_active_power, x = df$Datetime, type = "l", main="", xlab = "", ylab = "Global Active Power (kilowatts)")

#close device
dev.off()
}
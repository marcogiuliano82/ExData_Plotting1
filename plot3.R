plot3 <- function(){
      epc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
      epcFiltered <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007", ]
      epcFiltered$Datetime <- strptime(paste(epcFiltered$Date, epcFiltered$Time), format = "%d/%m/%Y %H:%M:%S")
      epcFiltered$Sub_metering_1 <- as.numeric(as.character(epcFiltered$Sub_metering_1))
      epcFiltered$Sub_metering_2 <- as.numeric(as.character(epcFiltered$Sub_metering_2))
      epcFiltered$Sub_metering_3 <- as.numeric(as.character(epcFiltered$Sub_metering_3))
      png(file = "plot3.png")
      par(mar=c(2,4,2,2))
      plot(epcFiltered$Datetime, epcFiltered$Sub_metering_1, type="n", ylab="Energy sub metering")
      lines(epcFiltered$Datetime, epcFiltered$Sub_metering_1)
      lines(epcFiltered$Datetime, epcFiltered$Sub_metering_2, col=c("red"))
      lines(epcFiltered$Datetime, epcFiltered$Sub_metering_3, col=c("blue"))
      legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
      dev.off()
}
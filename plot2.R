plot2 <- function(){
      epc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
      epcFiltered <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007", ]
      epcFiltered$Datetime <- strptime(paste(epcFiltered$Date, epcFiltered$Time), format = "%d/%m/%Y %H:%M:%S")
      epcFiltered$Global_active_power <- as.numeric(as.character(epcFiltered$Global_active_power))
      png(file = "plot2.png")
      par(mar=c(2,4,2,2))
      plot(epcFiltered$Datetime, epcFiltered$Global_active_power, type="n", ylab="Global Active Power (kilowatts)")
      lines(epcFiltered$Datetime, epcFiltered$Global_active_power)
      dev.off()
}
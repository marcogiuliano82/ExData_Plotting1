plot1 <- function(){
      epc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
      epcFiltered <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007", ]
      epcFiltered$Datetime <- strptime(paste(epcFiltered$Date, epcFiltered$Time), format = "%d/%m/%Y %H:%M:%S")
      epcFiltered$Global_active_power <- as.numeric(as.character(epcFiltered$Global_active_power))
      png(file = "plot1.png")  
      hist(epcFiltered$Global_active_power, col=c("red"), main="Global Active Power", xlab="Global Active Power (kilowatts)")
      dev.off()
}
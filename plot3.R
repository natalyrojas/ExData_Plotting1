plot3 <- function(){
  require(dplyr)
  
  # load data into R.
  hpc <- read.table('household_power_consumption.txt', header = TRUE, sep = ";")
  
  hpc <- mutate(hpc,newdate=as.Date(Date,"%d/%m/%Y"))
  
  
  hpc <- filter(hpc, (newdate=="2007-02-01" | newdate=="2007-02-02"))
  
  datetime <- paste(as.vector(hpc$Date), as.vector(hpc$Time))
  
  datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
  
  hpc$Sub_metering_1 <- as.vector(hpc$Sub_metering_1)
  hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
  
  hpc$Sub_metering_2 <- as.vector(hpc$Sub_metering_2)
  hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
  
  hpc$Sub_metering_3 <- as.vector(hpc$Sub_metering_3)
  hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)
  
  plot(datetime, hpc$Global_active_power, ylab="Enery sub metering", xlab ="", ylim=c(0,40), type = "n")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.7)
  lines(datetime, hpc$Sub_metering_1, col="black")
  lines(datetime, hpc$Sub_metering_2, col="red")
  lines(datetime, hpc$Sub_metering_3, col="blue")
  
  
  dev.copy(png, file="plot3.png")
  dev.off()
  
}
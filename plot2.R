plot2 <- function(){
  require(dplyr)
  
  # load data into R.
  hpc <- read.table('household_power_consumption.txt', header = TRUE, sep = ";")
  
  hpc <- mutate(hpc,newdate=as.Date(Date,"%d/%m/%Y"))
  
  
  hpc <- filter(hpc, (newdate=="2007-02-01" | newdate=="2007-02-02"))
  
  datetime <- paste(as.vector(hpc$Date), as.vector(hpc$Time))
  
  datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
  
  hpc$Global_active_power <- as.vector(hpc$Global_active_power)
  hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
  
  plot(datetime, hpc$Global_active_power, ylab="Global Active Power (kilowatts)", xlab ="", type = "n")
  lines(datetime, hpc$Global_active_power)
  
  
  dev.copy(png, file="plot2.png")
  dev.off()
  
}
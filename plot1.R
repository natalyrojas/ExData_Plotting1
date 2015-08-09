plot1 <- function(){

  # load data into R.
  hpc <- read.table('household_power_consumption.txt', header = TRUE, sep = ";")
  
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  
  hpc <- subset(hpc, Date == "2007-02-01" | Date  == "2007-02-02")
  
  hpc$Global_active_power <- as.vector(hpc$Global_active_power)
  hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
  
  par(mfrow = c(1,1))
  
  hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  
  dev.copy(png, file="plot1.png")
  dev.off()
  
}

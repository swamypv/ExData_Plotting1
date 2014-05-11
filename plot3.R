plot3 <- function(){
  
  #get lines numbers of the data where date is matching  
  lines <- grep('^[1-2]/2/2007', readLines("household_power_consumption.txt"))
  #Read the data              
  energy.data <- read.table(file="./household_power_consumption.txt", sep=";", stringsAsFactors=F, header=TRUE, skip=lines[1]-1, nrows=length(lines)-1)
  
  #Read header
  header_data <- read.table(file="./household_power_consumption.txt", sep=";", stringsAsFactors=F, header=FALSE,  nrows=1)
  #Assign header to dataset
  names(energy.data) <- header_data
  
  dt_tm <- strptime(paste(energy.data$Date, energy.data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S") 
  
  #Create plot
  plot(dt_tm,energy.data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(dt_tm,energy.data$Sub_metering_1 )
  lines(dt_tm,energy.data$Sub_metering_2, col="RED")
  lines(dt_tm,energy.data$Sub_metering_3, col = "Blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1,  col = c("black", "red", "blue"), cex=0.65)
  
  
  #Copy histogram to png file
  dev.copy(device=png, file="./ExData_Plotting1/plot3.png", width=480, height=480)
  
  dev.off()
  
  
  
}
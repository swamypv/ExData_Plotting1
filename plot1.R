plot1 <- function(){
  
#get lines numbers of the data where date is matching  
lines <- grep('^[1-2]/2/2007', readLines("household_power_consumption.txt"))
#Read the data              
energy.data <- read.table(file="./household_power_consumption.txt", sep=";", stringsAsFactors=F, header=TRUE, skip=lines[1]-1, nrows=length(lines)-1)

#Read header
header_data <- read.table(file="./household_power_consumption.txt", sep=";", stringsAsFactors=F, header=FALSE,  nrows=1)
#Assign header to dataset
names(energy.data) <- header_data

#Create histogram with color, heading and width and height
hist(energy.data$Global_active_power, xlab="Global Active Power (Kilowatts)", col="RED", main="Global Active Power")
#Copy histogram to png file
dev.copy(device=png, file="./ExData_Plotting1/plot1.png", width=480, height=480)

dev.off()



}
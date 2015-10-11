#load data
Raw_Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# subsetting two days
Q_data <- Raw_Data[Raw_Data$Date == "1/2/2007"|Raw_Data$Date == "2/2/2007",]
# converting column 1 and 2 to dates and times
Q_data$Date_Time <- with(Q_data, paste(Date, Time))
Q_data$Date_Time <- strptime(x = Q_data$Date_Time, format = "%d/%m/%Y %H:%M:%S")
#Create PNG file
png(file = "plot4.png")

#Make 4plots
  par(mfrow=c(2,2), mar = c(4, 4, 1, 1))
  
  
  #plot graphs
  plot(x = Q_data$Date_Time, y = Q_data$Global_active_power,type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
  
  plot(x = Q_data$Date_Time, y = Q_data$Voltage,type = "l",xlab = "datetime", ylab = "Voltage")
  
  with(Q_data,plot(Date_Time, Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = ""))
  with(Q_data, lines(Date_Time, Sub_metering_2, col="red"))
  with(Q_data, lines(Date_Time, Sub_metering_3, col="blue"))
  legend("topright", lty = 1, bty = "n",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(x = Q_data$Date_Time, y = Q_data$Global_reactive_power,type = "l",xlab = "datetime", ylab = "Global_reactive_power")
#Close Device
dev.off()

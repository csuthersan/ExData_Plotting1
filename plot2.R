#load data
Raw_Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# subsetting two days
Q_data <- Raw_Data[Raw_Data$Date == "1/2/2007"|Raw_Data$Date == "2/2/2007",]
# converting column 1 and 2 to dates and times
Q_data$Date_Time <- with(Q_data, paste(Date, Time))
Q_data$Date_Time <- strptime(x = Q_data$Date_Time, format = "%d/%m/%Y %H:%M:%S")
#Create PNG file
png(file = "plot2.png")
#plot graph
plot(x = Q_data$Date_Time, y = Q_data$Global_active_power,type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
lines(x = Q_data$Date_Time, y = Q_data$Global_active_power,type = "l")
#Close Device
dev.off()
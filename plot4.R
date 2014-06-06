##R file which create the plot 1 for the first assignment of the Exploratory Data Analysis
##The 4 plots show :
## - the different Global_active_power over a 2-day period in February, 2007 (1st and 2nd)
## - the different Voltage over a 2-day period in February, 2007 (1st and 2nd)
## - the different Sub metering over a 2-day period in February, 2007 (1st and 2nd)
## - the differentGlobal_reactive_power over a 2-day period in February, 2007 (1st and 2nd)


#Load the library
library(data.table)

#Read the file, indicates that NA are "?", set all columns to Character
data <- fread("household_power_consumption.txt",na.strings = "?", colClasses = rep("character",9))

#subset in order to select the two days we are interested in
dataTable <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Concatenate Date and Time columns into one vector containing the propoer Date Time object needed
DateTimeV <- strptime(paste(dataTable$Date, dataTable$Time),format="%d/%m/%Y %H:%M:%S")

# Open PNG device; create 'plot4.png' in my working directory
png("plot4.png")

#Change the layout of graphs in order to show 4 plots in one image
par(mfrow = c(2,2))

##First plot
plot(DateTimeV,as.numeric(dataTable$Global_active_power),type="l", ylab="Global Active Power", xlab="")

#Second plot
plot(DateTimeV,as.numeric(dataTable$Voltage), type="l",ylab="Voltage", xlab="datetime", col ="black")

#Third plot
plot(DateTimeV,as.numeric(dataTable$Sub_metering_1), type="l",ylab="Every sub metering", xlab="", col ="black")
points(DateTimeV,as.numeric(dataTable$Sub_metering_2), type="l", col="red")
points(DateTimeV,as.numeric(dataTable$Sub_metering_3), type="l", col="blue")

#Fourth plot
plot(DateTimeV,as.numeric(dataTable$Global_reactive_power), type="l",ylab="Global_reactive_power", xlab="", col ="black")

# Close the PNG file devices
dev.off()
  
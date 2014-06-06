##R file which create the plot 1 for the first assignment of the Exploratory Data Analysis
##The plot shows the different Sub Metering values over a 2-day period in February, 2007 (1st and 2nd)

#Load the library
library(data.table)

#Read the file, indicates that NA are "?", set all columns to Character
data <- fread("household_power_consumption.txt",na.strings = "?", colClasses = rep("character",9))


#subset in order to select the two days we are interested in
dataTable <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Concatenate Date and Time columns into one vector containing the propoer Date Time object needed
DateTimeV <- strptime(paste(dataTable$Date, dataTable$Time),format="%d/%m/%Y %H:%M:%S")

# Open PNG device; create 'plot3.png' in my working directory
png("plot3.png")

#Create the plot with the Sub Metering 1
plot(DateTimeV,as.numeric(dataTable$Sub_metering_1), type="l",ylab="Every sub metering", xlab="", col ="black")

#Add the plot of the Sub Metering 2 on the same plot as the first
points(DateTimeV,as.numeric(dataTable$Sub_metering_2), type="l", col="red")

#Add the plot of the Sub Metering 3 on the same plot as the first
points(DateTimeV,as.numeric(dataTable$Sub_metering_3), type="l", col="blue")

#Add the legend to the graph
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1);

# Close the PNG file devices
dev.off()




##R file which create the plot 2 for the first assignment of the Exploratory Data Analysis
##The plot shows the repartition of Global Active Power values over a 2-day period in February, 2007 (1st and 2nd)

#Load the library
library(data.table)

#Read the file, indicates that NA are "?", set all columns to Character
data <- fread("household_power_consumption.txt",na.strings = "?", colClasses = rep("character",9))


#subset in order to select the two days we are interested in
dataTable <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Concatenate Date and Time columns into one vector containing the propoer Date Time object needed
DateTimeV <- strptime(paste(dataTable$Date, dataTable$Time),format="%d/%m/%Y %H:%M:%S")

# Open PNG device; create 'plot2.png' in my working directory
png("plot2.png")

#Create the plot
plot(DateTimeV,as.numeric(dataTable$Global_active_power),type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Close the PNG file devices
dev.off()
                  



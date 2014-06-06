##R file which create the plot 1 for the first assignment of the Exploratory Data Analysis
##The plot shows the frenquency of Global Active Power values over a 2-day period in February, 2007 (1st and 2nd)


#Load the library
library(data.table)

#Read the file, indicates that NA are "?", set all columns to Character
data <- fread("household_power_consumption.txt",na.strings = "?", colClasses = rep("character",9))

#subset in order to select the two days we are interested in
dataFed <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Open PNG device; create 'plot1.png' in my working directory
png("plot1.png")

#Create the histogram
hist(as.numeric(dataFed$Global_active_power),main = "Global Active Power", col ="red", xlab = "Global Active Power (kilowatts)")

# Close the PNG file device
dev.off()
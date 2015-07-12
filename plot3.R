##read data in unzipped file
my_data <- read.table("Individual household electric power consumption Data Set.txt", sep=";", header = TRUE)

## subset data for required dates
my_data2 <- filter(my_data, my_data$Date == "2/2/2007" | my_data$Date == "1/2/2007")

## format variables as required by plots, Date and Time to date and POSIXct formats, respectively
my_data2$Date <- as.Date(my_data2$Date, format = "%d/%m/%Y")
my_data2$Time = paste(my_data2$Date, my_data2$Time, sep = " ")
my_data2$Time <- format(as.POSIXct(my_data2$Time) ,format = "%H:%M:%S")

#make metering variables numeric
my_data2$Sub_metering_1 <- as.numeric(paste(my_data2$Sub_metering_1))
my_data2$Sub_metering_2 <- as.numeric(paste(my_data2$Sub_metering_2))
my_data2$Sub_metering_3 <- as.numeric(paste(my_data2$Sub_metering_3))

par(mar = c(4,5,2,3))

## plot line graphs to understand various metering variables over the required 2 day period
## set options for line, y-axis title and leave x-axis empty
## use lines function to lay over metering 2 and 3 on the primary plot with metering 1
## use legend to add a lagend to the graphs and its options to set metering colors and placement 
## use axis function to set x-axis values
plot(my_data2$Sub_metering_1, type = "l",xaxt="n", xlab = " ", ylab="Energy sub metering", col = "black")
lines(my_data2$Sub_metering_2, col = "red")
lines(my_data2$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=c(1,1441,2881), labels=c("Thur", "Fri", "Sat"), tck=-.001)

##Img in png - Export button on Plots used. PNG file with a width of 480 pixels and a height of 480 pixels set in options during saving

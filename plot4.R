##read data in unzipped file
my_data <- read.table("Individual household electric power consumption Data Set.txt", sep=";", header = TRUE)

## subset data for required dates
my_data2 <- filter(my_data, my_data$Date == "2/2/2007" | my_data$Date == "1/2/2007")

## format variables as required by plots, Date and Time to date and POSIXct formats, respectively
my_data2$Date <- as.Date(my_data2$Date, format = "%d/%m/%Y")
my_data2$Time = paste(my_data2$Date, my_data2$Time, sep = " ")
my_data2$Time <- format(as.POSIXct(my_data2$Time) ,format = "%H:%M:%S")

#make all required variables numeric
my_data2$Global_active_power <- as.numeric(paste(my_data2$Global_active_power))
my_data2$Global_reactive_power <- as.numeric(paste(my_data2$Global_reactive_power))
my_data2$Voltage <- as.numeric(paste(my_data2$Voltage))

my_data2$Sub_metering_1 <- as.numeric(paste(my_data2$Sub_metering_1))
my_data2$Sub_metering_2 <- as.numeric(paste(my_data2$Sub_metering_2))
my_data2$Sub_metering_3 <- as.numeric(paste(my_data2$Sub_metering_3))

##change structure of plot to fit 4 plots - 2 col and 2 rows
par(mfcol = c(2,2))

par(mar = c(4, 4, 2, 3))

##plotting histogram from plot1
plot(my_data2$Global_active_power, cex.lab = .8, type = "l",xaxt="n", xlab = " ", ylab="Global Active Power" )
axis(1, at=c(1,1441,2881), labels=c("Thur", "Fri", "Sat"), tck=-.001)

##plotting graph from plot 3 with minor formatting changes
plot(my_data2$Sub_metering_1, type = "l", cex.lab = .8, xaxt="n", xlab = " ", ylab="Energy sub metering", col = "black")
lines(my_data2$Sub_metering_2, col = "red")
lines(my_data2$Sub_metering_3, col = "blue")
legend("topright",  cex = 0.7, bty = "n", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=c(1,1441,2881), labels=c("Thur", "Fri", "Sat"), tck=-.001)

## plot line graph to understand voltage over the required 2 day period
plot(my_data2$Voltage, type = "l",cex.lab = .8, xaxt="n", xlab = "datetime", ylab="Voltage" )
axis(1, at=c(1,1441,2881), labels=c("Thur", "Fri", "Sat"), tck=-.001)

## plot line graph to understand change in global reactive power over the required 2 day period
plot(my_data2$Global_reactive_power, type = "l", cex.lab = .8,xaxt="n", xlab = "datetime", ylab="Global_reactive_power", ylim = c(0.0, 0.5))
axis(1, at=c(1,1441,2881), labels=c("Thur", "Fri", "Sat"), tck=-.001)

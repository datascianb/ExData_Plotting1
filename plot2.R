##read data in unzipped file
my_data <- read.table(paste(getwd(),"/Individual household electric power consumption Data Set.txt", sep=""), sep=";", header = TRUE)

## subset data for required dates
my_data2 <- filter(my_data, my_data$Date == "2/2/2007" | my_data$Date == "1/2/2007")

## format variables as required by plots, Date and Time to date and POSIXct formats, respectively
my_data2$Date <- as.Date(my_data2$Date, format = "%d/%m/%Y")
my_data2$Time = paste(my_data2$Date, my_data2$Time, sep = " ")
my_data2$Time <- format(as.POSIXct(my_data2$Time))

#make global active power numeric
my_data2$Global_active_power <- as.numeric(paste(my_data2$Global_active_power))

par(mar = c(4,5,2,3))

## plot line graph to understand change in global active power over the required 2 day period
## set options for line, y-axis title and leave x-axis empty
## use axis function to set x-axis values
plot(my_data2$Global_active_power, type = "l",xaxt="n", xlab = " ", ylab="Global Active Power (kilowatts)" )
axis(1, at=c(1,1441,2881), labels=c("Thur", "Fri", "Sat"), tck=-.001)

##Img in png - Export button on Plots used. PNG file with a width of 480 pixels and a height of 480 pixels set in options during saving

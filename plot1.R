##read data in unzipped file
my_data <- read.table("Individual household electric power consumption Data Set.txt", sep=";", header = TRUE)

## subset data for required dates
my_data2 <- filter(my_data, my_data$Date == "2/2/2007" | my_data$Date == "1/2/2007")

## format variables as required by plots, Date and Time to date and POSIXct formats, respectively
my_data2$Date <- as.Date(my_data2$Date, format = "%d/%m/%Y")
my_data2$Time = paste(my_data2$Date, my_data2$Time, sep = " ")
my_data2$Time <- format(as.POSIXct(my_data2$Time) ,format = "%H:%M:%S")

#make global active power numeric
my_data2$Global_active_power <- as.numeric(paste(my_data2$Global_active_power))

## plot histogram to understand distribution of global active power over the required 2 day period
## set options for color of bars, main and axes titles, and axes values if required
## set border spacing to be able to fit plot and see all features

par(mar = c(4,5,2,3))
hist(my_data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))

##Img in png - Export button on Plots used. PNG file with a width of 480 pixels and a height of 480 pixels set in options during saving


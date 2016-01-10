#reading data into table
hpc_data <- read.table("household_power_consumption.txt", sep=";",na.strings="?", header=T,  stringsAsFactors=FALSE)

#loading library
library(lubridate)

#pasting date/times
hpc_data$date_time=dmy_hms(paste(hpc_data$Date, hpc_data$Time))

#formatting date variable
hpc_data$Date<-as.Date(hpc_data$Date, format="%d/%m/%Y")

#subsetting
hpc<-hpc_data[ which(hpc_data$Date>="2007-02-01" & hpc_data$Date<="2007-02-02"),]

#plotting
plot(hpc$date_time, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")

#saving png file
dev.copy(png, file="plot2.png",width=480,height=480)
dev.off()
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

#first line
plot(hpc$date_time, hpc$Sub_metering_1, type = "l", ylim=c(0.0,38), ylab = "Energy Sub metering", xlab = " ")

#2nd line
par(new = T)
plot(hpc$date_time, hpc$Sub_metering_2, type = "l", ylim=c(0.0,38), col="red", axes = T, xlab=" ", ylab = "")

#3rd line
par(new = T)
plot(hpc$date_time, hpc$Sub_metering_3, type = "l", ylim=c(0.0,38), col="blue", axes = T, xlab=" ", ylab = " ")

#legend
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(1.5,1.5,1.5), col = c("black", "red", "blue"))

#saving png file
dev.copy(png, file="plot3.png",width=480,height=480)
dev.off()
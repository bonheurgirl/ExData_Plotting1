#read data
hpc <- read.table("household_power_consumption.txt", sep=";",na.strings="?", header=T,  stringsAsFactors=FALSE)
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")
hpc$Time<--sub(".* ", "", hpc$Time)

#subsetting dates needed
epc_data<-hpc[ which(hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02"),]
epc_data$Time<-strptime(epc_data$Time, format="%H:%M:%S")

#plotting
hist(epc_data$Global_active_power,breaks=11, main="Global Active Power", col="red",  xlab="Global Active Power (kilowatts)")

#saving png file
dev.copy(png, file="plot1.png",width=480,height=480)
dev.off()

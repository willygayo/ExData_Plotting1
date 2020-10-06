#Creating subset from household_power_consumption.txt from 1/2/2007 to 2/2/2007
datapower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(datapower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdatapower <- subset(datapower,datapower$Date=="1/2/2007" | datapower$Date =="2/2/2007")

#Plotting the histogram of the Global Active Power
hist(as.numeric(as.character(subdatapower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#Creating a png file
dev.copy(png, filename="plot1.png")
dev.off()
#Creating subset from household_power_consumption.txt from 1/2/2007 to 2/2/2007
datapower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(datapower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdatapower <- subset(datapower,datapower$Date=="1/2/2007" | datapower$Date =="2/2/2007")

#Transforming the Date and Time variables from characters to objects of type Date and POSIXlt, respectively
subdatapower$Date <- as.Date(subdatapower$Date, format="%d/%m/%Y")
subdatapower$Time <- strptime(subdatapower$Time, format="%H:%M:%S")
subdatapower[1:1440,"Time"] <- format(subdatapower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdatapower[1441:2880,"Time"] <- format(subdatapower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plotting the subdataset
plot(subdatapower$Time,as.numeric(as.character(subdatapower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#Creating a png file
dev.copy(png, filename="plot2.png")
dev.off()
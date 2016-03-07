library(lubridate)

#read data into R & toss everything outside of our target dates
#requires data to be in a file named "data.txt"
data <- read.table("data.txt",header=T,sep=";",na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#clean up dates and times a bit
data$DT <- dmy_hms(paste(data$Date,data$Time))

#make the plots
png("plot4.png")
par(mfrow=c(2,2),mar=c(4,4,1,1))

with(data,plot(DT,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(data,lines(DT,Global_active_power))

with(data,plot(DT,Voltage,type="n",xlab="datetime",ylab="Voltage"))
with(data,lines(DT,Voltage))

with(data,plot(DT,Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering"))
with(data,lines(DT,Sub_metering_1,col="black"))
with(data,lines(DT,Sub_metering_2,col="red"))
with(data,lines(DT,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)

with(data,plot(DT,Global_reactive_power,type="n",xlab="datetime",ylab="Global Reactive Power"))
with(data,lines(DT,Global_reactive_power))

dev.off()

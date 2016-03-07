library(lubridate)

#read data into R & toss everything outside of our target dates
#requires data to be in a file named "data.txt"
data <- read.table("data.txt",header=T,sep=";",na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#clean up dates and times a bit
data$DT <- dmy_hms(paste(data$Date,data$Time))

#plot created below
png("plot2.png")
with(data,plot(DT,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(data,lines(DT,Global_active_power))
dev.off()

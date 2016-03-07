#read data into R & toss everything outside of our target dates
#requires data to be in a file named "data.txt"
data <- read.table("data.txt",header=T,sep=";",na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#code for creating plot below
png("plot1.png")
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()


> hpd<-read.table("~/exdata-data-household_power_consumption/household_power_consumption.txt",header=T,sep=";",na.strings="?")
hpd
hpd2<-subset(hpd,hpd$Date == "1/2/2007" | hpd$Date == "2/2/2007")
SetTime <- strptime(paste(hpd2$Date, hpd2$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
hpd2<-cbind(SetTime,hpd2)

#plot4
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(Global_active_power ~ SetTime,hpd2,type="l",ylab="Global Active Power",xlab="")
plot(Voltage ~ SetTime,hpd2,ylab="Voltage",xlab="datetime",type="l")
plot(Sub_metering_1 ~ SetTime,hpd2,ylab="Energy sub metering",xlab="",type="l")
lines(Sub_metering_2 ~ SetTime, hpd2, type="l",col="red")
lines(Sub_metering_3 ~ SetTime, hpd2, type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),bty="n")
plot(Global_reactive_power ~ SetTime, hpd2,ylab="Global_reactive_power",xlab="datetime",type = "l")
dev.off()
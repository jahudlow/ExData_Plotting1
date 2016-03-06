> hpd<-read.table("~/exdata-data-household_power_consumption/household_power_consumption.txt",header=T,sep=";",na.strings="?")
hpd
hpd2<-subset(hpd,hpd$Date == "1/2/2007" | hpd$Date == "2/2/2007")
SetTime <- strptime(paste(hpd2$Date, hpd2$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
hpd2<-cbind(SetTime,hpd2)

#plot2
png(filename="plot2.png",width=480,height=480)
plot(Global_active_power~SetTime,hpd2,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()
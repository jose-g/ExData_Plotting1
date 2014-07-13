ds<-read.table("household_power_consumption.txt",sep=";",header=TRUE,skip=0,nrow=1)
mycol<-names(ds)
ds<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",skip=66636,nrow=2880)
colnames(ds)<-mycol
ds$Date<-paste(ds$Date,ds$Time)
ds$Date<-strptime(ds$Date, "%d/%m/%Y %H:%M:%S")
ds<-ds[,-2,drop=TRUE]
png("./figure/plot4.png",height=480,width=480)
par(mfrow=c(2,2))
# graph 1
with(ds$Date, plot(ds$Global_active_power, type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)"))
axis(1, at=c(1,nrow(ds)/2,nrow(ds)),labels=c("Thu","Fri","Sat"))
# graph 2
with(ds$Date, plot(ds$Voltage, type="l",xaxt="n",xlab="datetime",ylab="Voltage"))
axis(1, at=c(1,nrow(ds)/2,nrow(ds)),labels=c("Thu","Fri","Sat"))
# graph 3
plot (x= ds$Date, y= ds$Sub_metering_1,type ="l",xlab ="",ylab = "Energy sub metering")
lines (x= ds$Date, y= ds$Sub_metering_2, col ="red")
lines (x= ds$Date, y= ds$Sub_metering_3, col ="blue")
axis(1, at=c(1,nrow(ds)/2,nrow(ds)),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n",lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"))
# graph 4
with(ds$Date, plot(ds$Global_reactive_power, type="l",xaxt="n",xlab="datetime",ylab="Global_reactive_power"))
axis(1, at=c(1,nrow(ds)/2,nrow(ds)),labels=c("Thu","Fri","Sat"))
dev.off()

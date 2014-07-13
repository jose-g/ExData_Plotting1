ds<-read.table("household_power_consumption.txt",sep=";",header=TRUE,skip=0,nrow=1)
mycol<-names(ds)
ds<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",skip=66636,nrow=2880)
colnames(ds)<-mycol
ds$Date<-paste(ds$Date,ds$Time)
ds$Date<-strptime(ds$Date, "%d/%m/%Y %H:%M:%S")
ds<-ds[,-2,drop=TRUE]
png("./figure/plot1.png",height=480,width=480)
hist(ds$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
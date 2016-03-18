###################################
#Read in Energy data

power=read.table("household_power_consumption.txt",sep=";",header=T,
                 stringsAsFactors=F);str(power)
##read in power dataset from UC Irvine: 
##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

power$Date=as.Date(power$Date,"%d/%m/%Y");str(power)
##change Date to date format

power_2days=power[power$Date > "2007-01-31" & power$Date < "2007-02-03", ]
str(power_2days);head(power_2days);tail(power_2days)
##subset only February 1st and 2nd of 2007

summary(as.numeric(power_2days$Global_active_power))

power_2days$time.date=as.POSIXct(with(power_2days,paste(Date,Time)))
##combine date and time

####################################
#Plot 3

with(power_2days,plot(time.date,Sub_metering_1,ylab="Energy sub meeting",xlab=" ",type="l"))
with(power_2days,lines(time.date,Sub_metering_2,col="red"))
with(power_2days,lines(time.date,Sub_metering_3,col="blue"))

legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
"Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,cex=.48,pt.cex=1)

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()





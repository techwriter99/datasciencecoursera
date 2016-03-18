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

  ##look at distribution of power

###################################
#Plot 1

with(power_2days,hist(as.numeric(Global_active_power),col="red",
xlab="Global Active Power (kilowatts)",main="Global Active Power"))

dev.copy(png,file="plot.1.png",height=480,width=480)

dev.off()







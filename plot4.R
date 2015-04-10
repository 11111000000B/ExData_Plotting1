pollution <- read.csv(file="C:/Users/x/Dropbox/rdata/hpc.txt", colClasses = c("character", "character",  "numeric", "numeric", "numeric",  "numeric", "numeric", "numeric","numeric"),header=TRUE, sep=";", as.is=TRUE, na.strings="?")
#head(pollution)
#define range for subsetting dataframe
range<-seq(as.Date('2007-2-1'),by='days',length=2)

test<-subset(pollution, Date %in% range)
head(test)
#for English names of the months
Sys.setlocale("LC_TIME", "C");
test[[2]]<-strptime((paste (test$Date, test$Time)), "%Y-%m-%d %H:%M:%S")


png(file="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))
with(test, {
  plot(test$Time, Global_active_power, type="l", xlab=NA, ylab="Global Active Power")
  plot(test$Time, Voltage, ylim=c(234,246),type="l", xlab="datetime", ylab="Voltage")
  plot(test$Time, Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering")
  lines(test$Time, Sub_metering_1, col = "black")
  lines(test$Time, Sub_metering_2, col = "red")
  lines(test$Time, Sub_metering_3, col = "blue")
  plot(test$Time, Global_reactive_power, ylim=c(.0,.5),type="l", xlab="datetime", ylab="Global_reactive_power")
}
)

dev.off()
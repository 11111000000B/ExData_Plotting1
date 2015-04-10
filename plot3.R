pollution <- read.csv(file="C:/Users/x/Dropbox/rdata/hpc.txt", colClasses = c("character", "character",  "numeric", "numeric", "numeric",  "numeric", "numeric", "numeric","numeric"),header=TRUE, sep=";", as.is=TRUE, na.strings="?")
#head(pollution)
#define range for subsetting dataframe
range<-seq(as.Date('2007-2-1'),by='days',length=2)

test<-subset(pollution, Date %in% range)
head(test)
#for English names of the months
Sys.setlocale("LC_TIME", "C");
test[[2]]<-strptime((paste (test$Date, test$Time)), "%Y-%m-%d %H:%M:%S")


png(file="plot3.png",width=480,height=480)
with(test, plot(test$Time, Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering"))
with(test, lines(test$Time, Sub_metering_1, col = "black"))
with(test, lines(test$Time, Sub_metering_2, col = "red"))
with(test, lines(test$Time, Sub_metering_3, col = "blue"))
legend(legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), "topright",lwd=1, lty=c(1,1,1), pch = c(NA, NA, NA), col = c("black", "red", "blue"))
dev.off()

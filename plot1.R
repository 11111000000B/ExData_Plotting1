pollution <- read.csv(file="C:/Users/x/Dropbox/rdata/hpc.txt", colClasses = c("character", "character",  "numeric", "numeric", "numeric",  "numeric", "numeric", "numeric","numeric"),header=TRUE, sep=";", as.is=TRUE, na.strings="?")
#head(pollution)
#define range for subsetting dataframe
range<-seq(as.Date('2007-2-1'),by='days',length=2)

test<-subset(pollution, Date %in% range)
head(test)
#for English names of the months
Sys.setlocale("LC_TIME", "C");
test[[2]]<-strptime((paste (test$Date, test$Time)), "%Y-%m-%d %H:%M:%S")


png(file="plot1.png",width=480,height=480)
hist(test$Global_active_power, ylim = c(0, 1200), col="red", breaks = 12, main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
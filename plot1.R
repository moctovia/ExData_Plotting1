## Exploratory data analysis course project 1##
## Create plot1.png ##

plot1 <- function() {
   
# extract data over a 2-day period in February, 2007: 2007-02-01 and 2007-02-02
allData<-read.table("household_power_consumption.txt",sep=";", header = FALSE, skip = 66637, nrows = 2880)

# extract header
header<-read.table("household_power_consumption.txt",sep=";", nrows = 1)

#transpose header values
header<-t(header)

#set allData's Column names with values in header data frame
colnames(allData)<-header[,1]

#Convert the Date and Time variables in allData to Date/Time classes in R
allData[,1]<-as.Date(allData[,1], format = "%d/%m/%Y")

#set plot margins
par(mar = c(4,4,2,1))

#plot histogram using allData
hist(allData$Global_active_power,
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylim = c(0,1200),
     col = "red"
     )

# copy plot to file, set the height & width
dev.copy(png,file = "plot1.png",width = 480, height = 480)

dev.off()
}


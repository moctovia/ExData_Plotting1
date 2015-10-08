## Exploratory data analysis course project 1##
## Create plot2.png ##
 
plot2 <- function() {
  
  # extract data over a 2-day period in February, 2007: 2007-02-01 and 2007-02-02
  allData<-read.table("household_power_consumption.txt",sep=";", header = FALSE, skip = 66637, nrows = 2880)
  
  # extract header
  header<-read.table("household_power_consumption.txt",sep=";", nrows = 1)
  
  #transpose header values
  header<-t(header)
  
  #set allData's Column names with values in header data frame
  colnames(allData)<-header[,1]
  
  #Convert the Date and Time variables in allData to Date/Time classes in R
  allData["DateTime"]<- paste(allData$Date, allData$Time, sep=" ")
  allData$DateTime<-strptime(allData$DateTime, format = "%d/%m/%Y %H:%M:%S")

  #set plot margins
  par(mar = c(4,4,2,1))
  
  #plot line graph using allData
  plot(x=allData$DateTime, 
       y=allData$Global_active_power, 
       ylab = "Global Active Power (kilowatts)",
       xlab = "",
       type = "l"
       )
  
  
  # copy plot to file, set the height & width
  dev.copy(png,file = "plot2.png",width = 480, height = 480)
  
  dev.off()
}


## Exploratory data analysis course project 1##
## Create plot3.png ##

plot3 <- function() {
  
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
  
  # Save plot result in png file
  png("plot3.png", width = 480, height = 480)
  
  #set plot margins
  par(mar = c(5,4,1,1))
  
  #plot line graph using allData
  plot(x=allData$DateTime, 
       y=allData$Global_active_power, 
       ylab = "Global Active Power (kilowatts)",
       xlab = "",
       type = "l"
  )
  
  #create base plot
  plot(allData$DateTime, 
       allData$Sub_metering_1, 
       type = "l",
       ylab = "Energy sub metering",
       xlab = "")
  
  #add points for Sub_metering_2 and 3 to base plot
  with(allData, points(DateTime, Sub_metering_2, col = "red", type = "l"))
  with(allData, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
  
  # add legend box
  legend("topright", lwd = 1 ,
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3"))
  
  dev.off()
}


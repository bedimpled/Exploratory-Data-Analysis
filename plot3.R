
#------- Getting full dataset ------- 
fullData <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",  
              nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y") 
 

#------ Subsetting the data ------- 
data <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(fullData) 


#------- Converting dates to format dd/mm/yyyy -------
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 
 

#------- Plot 3 ------- 
with(data, { 
   plot(Sub_metering_1~Datetime, type="l", 
        ylab="Global Active Power (kilowatts)", xlab="") 
   lines(Sub_metering_2~Datetime,col='Red') 
   lines(Sub_metering_3~Datetime,col='Blue') 
}) 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 


#------ Saving the file ------
dev.copy(png, file="plot3.png", height=480, width=480) 


#------- Closing the graphics device in R ------
dev.off() 



#-------- Getting the full dataset --------

fullData <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",  
           nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y") 


#------- Subsetting the data ---------- 
data <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(fullData) 
 

#------- Converting dates ----------- 
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 
 

#------- Plot 1 ---------- 
hist(data$Global_active_power, main="Global Active Power",  
        xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
 

#------ Saving the file ------
dev.copy(png, file="plot1.png", height=480, width=480) 


#------- Closing the graphics device in R ------
dev.off() 
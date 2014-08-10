# Set working directory 
setwd("C:/Users/Josh.Josh-PC/OneDrive/Documents/Coursera/DataAnalysis")

# get the file path and load the data
filepath <- "C:/Users/Josh.Josh-PC/OneDrive/Documents/Coursera/DataAnalysis/household_power_consumption.txt"
myData <- read.table(filepath,header=TRUE,sep=";",colClasses="character")


# Convert to Date/Time clsases
myData[,1] <- as.Date(myData$Date,"%d/%m/%Y")

sub <- subset(myData, myData$Date %in% as.Date(c("2007-02-01","2007-02-02")))

# Cast the rest of the columns as numeric
sub[,3] <- as.numeric(sub[,3])
sub[,4] <- as.numeric(sub[,4])
sub[,5] <- as.numeric(sub[,5])
sub[,6] <- as.numeric(sub[,6])
sub[,7] <- as.numeric(sub[,7])
sub[,8] <- as.numeric(sub[,8])
sub[,9] <- as.numeric(sub[,9])

sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S")

plot(sub$DateTime, sub[,3], type = "l", ylab = "Global Active Power (kilowatts)", xlab = " " )

# Copy to PNG file for submission
dev.copy(png,file="plot2.png",width = 480, height = 480)

# Close device
dev.off()

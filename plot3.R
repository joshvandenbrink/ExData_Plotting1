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

plot(sub$DateTime, sub[,7], type = "l", ylab = "Energy sub metering", xlab = " " )
lines(sub$DateTime,sub[,8], col = "Red")
lines(sub$DateTime,sub[,9], col = "Blue")

legend(x="topright", pch = NULL, col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lwd = 1, cex=0.6, )

# Copy to PNG file for submission
dev.copy(png,file="plot3.png", width = 480, height = 480)

# Close device
dev.off()

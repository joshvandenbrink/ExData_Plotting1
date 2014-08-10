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

#set the matrix for the plots to fill in
par(mfrow = c(2,2), mar = c(4,4,2,1))

#recreate plot 2
plot(sub$DateTime, sub[,3], type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ", cex.main =0.5 )

# Plot Voltage
plot(sub$DateTime, sub[,5], type = "l", ylab = "Voltage", xlab = "datetime" ,cex =0.5 )

#recreate plot 3
plot(sub$DateTime, sub[,7], type = "l", ylab = "Energy sub metering", xlab = " ", cex =0.5 )
lines(sub$DateTime,sub[,8], col = "Red")
lines(sub$DateTime,sub[,9], col = "Blue")

# Plot Global_reactive_power
plot(sub$DateTime, sub[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex =0.5)

# Copy to PNG file for submission
dev.copy(png,file="plot4.png")

# Close device
dev.off()

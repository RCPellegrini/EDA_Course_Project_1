## Loading Data
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "downloadedFile.zip")
unzip("downloadedFile.zip")
household <- "household_power_consumption.txt"
household <- read.table(household, header=TRUE, sep=";", na.strings="?")
    ##class(household$Date)

## Selecting interested data
interested_data <- household[household$Date %in% c("1/2/2007","2/2/2007"),]
    ##head(interested_data)

## Converting the classes from Date and Time. 
interested_data$newdate <- with(interested_data, strptime(paste(Date, Time, sep = " "), format="%d/%m/%Y %H:%M:%S"))
names(interested_data) 

## Making Plot3
lineColors <-c("black", "red", "blue")
legendsNames <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(interested_data$newdate, interested_data$Sub_metering_1,type = "l", xlab="", ylab = "Energy sub metering", col=lineColors[1], lwd = "1")
lines(interested_data$newdate, interested_data$Sub_metering_2,type = "l", col=lineColors[2], lwd = "1")
lines(interested_data$newdate, interested_data$Sub_metering_3,type = "l", col=lineColors[3], lwd = "1")
legend("topright", legend = legendsNames ,col = lineColors,lty=1, cex=1.1, pt.cex = 2)

dev.copy(png, file = "plot3.png")
dev.off()

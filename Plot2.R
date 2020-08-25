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

## Making Plot2
plot(interested_data$newdate, interested_data$Global_active_power,type = "l", xlab="", ylab = "Global Active Power (kilowatts)", col="black")
dev.copy(png, file = "plot2.png")
dev.off()

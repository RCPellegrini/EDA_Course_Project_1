## Loading Data
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "downloadedFile.zip")
unzip("downloadedFile.zip")
household <- "household_power_consumption.txt"
household <- read.table(household, header=TRUE, sep=";", na.strings="?")

## Selecting interested data
interested_data <- household[household$Date %in% c("1/2/2007","2/2/2007"),]
    ##head(interested_data)

## Making Plot1
with(interested_data, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = " Global Active Power", col="red"))
dev.copy(png, file = "plot1.png")
dev.off()

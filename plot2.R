###update data_loc to appropriate file path where data file is saved
data_loc <- "~/Data Science Course/Course 4 Exploratory Data Analysis/Week 1 Assignment/household_power_consumption.txt"

householdpc <- read.table(data_loc, head = TRUE, sep=";", na.strings = "?")
graphics.off()
finalData <- householdpc[householdpc$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

with(finalData, plot(SetTime, Global_active_power, type="line", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()
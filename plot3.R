###update data_loc to appropriate file path where data file is saved
data_loc <- "~/Data Science Course/Course 4 Exploratory Data Analysis/Week 1 Assignment/household_power_consumption.txt"

householdpc <- read.table(data_loc, head = TRUE, sep=";", na.strings = "?")
graphics.off()

finalData <- householdpc[householdpc$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

with(finalData, plot(SetTime, Sub_metering_1, type="line",
                     col="black",
                     xlab="",
                     ylab="Energy sub metering"))

lines(finalData$SetTime,finalData$Sub_metering_2, col="red")
lines(finalData$SetTime,finalData$Sub_metering_3, col="blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = "solid")
dev.copy(png, file = "plot3.png")
dev.off()
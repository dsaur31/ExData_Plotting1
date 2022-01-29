householdpc <- read.table(data_loc, head = TRUE, sep=";", na.strings = "?")
graphics.off()

finalData <- householdpc[householdpc$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

par(mfrow=c(2,2))

with(finalData, plot(SetTime, Global_active_power,type="line", col="black", xlab = "", ylab ="Global Active Power"))
with(finalData, plot(SetTime, Voltage, type="line", col="black", xlab = "datetime", ylab ="Voltage"))
with(finalData, plot(SetTime, Sub_metering_1, type="line", bty="n",
                     col="black",
                     xlab="",
                     ylab="Energy sub metering"))

lines(finalData$SetTime,finalData$Sub_metering_2, col="red")
lines(finalData$SetTime,finalData$Sub_metering_3, col="blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = "solid")
with(finalData, plot(SetTime, Global_reactive_power, type="line", col="black", xlab = "datetime", ylab ="Global_reactive_power"))


dev.copy(png, file = "plot4.png")
dev.off()
library(dplyr)
library(lubridate)
path <- "./household_power_consumption.txt"
epc <- read.table(path, header = TRUE, sep = ";")
epc_2days <- filter(epc, paste(epc$Date) %in% c("1/2/2007", "2/2/2007"))
x <- dmy_hms(paste(epc_2days$Date, epc_2days$Time))
sm1 <- paste(epc_2days$Sub_metering_1)
sm2 <- paste(epc_2days$Sub_metering_2)
sm3 <- paste(epc_2days$Sub_metering_3)
plot(x, sm1, xlab = "", ylab = "Energy sub metering", col = "white")
lines(x[order(x)], sm1[order(x)], xlim=range(x), ylim=range(sm1))
lines(x[order(x)], sm2[order(x)], xlim=range(x), ylim=range(sm2), col = "red")
lines(x[order(x)], sm3[order(x)], xlim=range(x), ylim=range(sm3), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue") )
dev.copy(png, file = "plot3.png")

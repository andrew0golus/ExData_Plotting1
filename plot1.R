library(dplyr)
library(lubridate)
path <- "./household_power_consumption.txt"
epc <- read.table(path, header = TRUE, sep = ";")
epc_2days <- filter(epc, paste(epc$Date) %in% c("2/2/2007", "1/2/2007"))
x <- as.numeric(paste(epc_2days$Global_active_power))
hist(x, col = "red", breaks = 15, main = "Global Active Power", xlab = "Global Active Power (killowats)")
dev.copy(png, file = "plot1.png")
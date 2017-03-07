## Code for Coursera Course 4 Week 1 PA: Plot 4/PNG 4
plot4 <- function() {
  ## STEP 1 - Read in data frame from text file.
  folderPath <- "household_power_consumption.txt"
  importDF <- read.table(file = folderPath, header = TRUE, sep = ";", stringsAsFactors = FALSE)
  
  ## STEP 2 - Subset data based on relevant Dates: 2007-02-01 & 2007-02-02
  importDF[,1] <- as.Date(x = importDF[,1], format = "%d/%m/%Y")
  subSetOnDatesDF <- importDF[which(importDF$Date == "2007-02-01" | importDF$Date == "2007-02-02"),] 
  timeLog <- strptime(x = paste(subSetOnDatesDF$Date, subSetOnDatesDF$Time, sep = ";"), format = "%Y-%m-%d; %H:%M:%S")
  
  ## STEP 3 - Create PNG of a line graph w/ multiple lines
  png("plot4.png", width = 480, height = 480)
  par(mfrow = c(2,2))
  ## Plot 1 = [topleft] Line graph of Global Active Power over time.
  plot(type = "l", x = timeLog, y = subSetOnDatesDF$Global_active_power, xlab = " ", ylab = "Global Active Power")
  ## Plot 2 = [topright] Line graph of Voltage over time.
  plot(type = "l", x = timeLog, y = subSetOnDatesDF$Voltage, xlab = "datetime", ylab = "Voltage")
  ## Plot 3 = [bottomleft] Line graph (3 lines) of energy submetering over time.
  plot(type = "l" , x = timeLog, y = subSetOnDatesDF$Sub_metering_1, ylab = "Energy sub metering", xlab = " ")
  lines(type = "l", x = timeLog, y = subSetOnDatesDF$Sub_metering_2, col = "red")
  lines(type = "l", x = timeLog, y = subSetOnDatesDF$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")
  ## Plot 4 = [bottomright] Line graph of Global Reactive Power over time.
  plot(type = "l", x = timeLog, y = subSetOnDatesDF$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power")
  invisible(dev.off())
  
  
}
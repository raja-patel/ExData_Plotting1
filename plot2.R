## Code for Coursera Course 4 Week 1 PA: Plot 2/PNG 2
plot2 <- function() {
  ## STEP 1 - Read in data frame from text file.
  folderPath <- "household_power_consumption.txt"
  importDF <- read.table(file = folderPath, header = TRUE, sep = ";", stringsAsFactors = FALSE)
  
  ## STEP 2 - Subset data based on relevant Dates: 2007-02-01 & 2007-02-02
  ## convert Date & Time columns to Date and Time variables
  ## - Date: use as.Date()
  importDF[,1] <- as.Date(x = importDF[,1], format = "%d/%m/%Y")
  subSetOnDatesDF <- importDF[which(importDF$Date == "2007-02-01" | importDF$Date == "2007-02-02"),] 
  pwrConsuptTimeLog <- strptime(x = paste(subSetOnDatesDF$Date, subSetOnDatesDF$Time, sep = ";"), format = "%Y-%m-%d; %H:%M:%S")
  
  ## STEP 3 - Create PNG of a line graph
  png(filename = "plot2.png", width = 480, height = 480)
  plot(type = "l" ,x = pwrConsuptTimeLog, y = subSetOnDatesDF$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = " ")
  invisible(dev.off())
}
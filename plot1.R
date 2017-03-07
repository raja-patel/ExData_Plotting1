## Code for Coursera Course 4 Week 1 PA: Plot 1/PNG 1
plot1 <- function() {
  ## STEP 1 - Read in data frame from text file.
  folderPath <- "household_power_consumption.txt"
  importDF <- read.table(file = folderPath, header = TRUE, sep = ";", stringsAsFactors = FALSE)
  
  ## STEP 2 - Subset data based on relevant Dates: 2007-02-01 & 2007-02-02
  ## convert Date & Time columns to Date and Time variables
  ## - Date: use as.Date()
  importDF[,1] <- as.Date(x = importDF[,1], format = "%d/%m/%Y")
  subSetOnDatesDF <- importDF[which(importDF$Date == "2007-02-01" | importDF$Date == "2007-02-02"),]
  
  ## STEP 3 - Create PNG of a histogram 
  ## Histogram of "Global_active_power" has red bars
  png(filename = "plot1.png", width = 480, height = 480)
  hist(x = as.numeric(subSetOnDatesDF$Global_active_power), main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")
  invisible(dev.off())
  
}

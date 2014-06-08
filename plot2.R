######### EXPLORATORY DATA ANALYSIS: ASSIGNMENT 1 
######### June 8, 2014


# Set working directory
setwd ("C://Users//irefck//SkyDrive//1 COURSES//Coursera Courses//DATA SCIENCE SPECIALIZATION//4 Exploratory Data Analysis//Assignment1")

# Download the zip file to working directory
power <- ("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
download.file(power, destfile = "exdata_data_household_power_consumption.zip")

#check for data files setup and decompress the zip if needed

if (!file.exists("exdata_data_household_power_consumption")) {
  if (!file.exists("exdata_data_household_power_consumption.zip")) {
    stop("was expecting Household Power Consumption folder or zip file")
  } else {
    unzip("exdata_data_household_power_consumption.zip")
  }
}

# Read the dataset
energy <-  read.table("household_power_consumption.txt", sep = ";", header=TRUE, 
                      na.strings = "?", stringsAsFactors=FALSE)

# Format the date variable 
energy$Date <- as.Date(energy$Date, format="%d/%m/%Y")

# Subset dataset and only keep the following dates: "2007-02-01" and "2007-02-02"
feb2007 <- subset(energy, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

# Remove larger dataset, which is no longer needed
rm(energy)

# Create Date-Time variable
feb2007$datetime <- paste(feb2007$Date, feb2007$Time)

# Format Date-Time variable using lubridate package
library(lubridate)
feb2007$datetime <- ymd_hms(feb2007$datetime)

dim(feb2007) # View the dimension of the dataset
str(feb2007) # View dataset structure


# PLOT 2

  # Create Plot 2

plot(feb2007$datetime,feb2007$Global_active_power, type="l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

  # Save Plot 2 to working directory
dev.copy(png, 'plot2.png', width = 480, height = 480, units = "px")

  # Close PNG device
dev.off()


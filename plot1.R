library(sqldf) ## need sqldf library for filter read of file
plot1_df <- read.csv2.sql(file = "household_power_consumption.txt",
        sql = "select Global_active_power from file where Date = '1/2/2007' 
        or Date = '2/2/2007'")
png(file="plot1.png")  #create a blank png file in directory to draw on it
hist(plot1_df$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
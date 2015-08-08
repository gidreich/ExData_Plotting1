library(sqldf) ## need sqldf library for filter read of file
library(datasets)  ## for the use of "with" below
plot2_df <- read.csv2.sql(file = "household_power_consumption.txt",
        sql = "select Global_active_power, Date, Time from file where Date = '1/2/2007' 
        or Date = '2/2/2007'")
png(file="plot2.png")  #create a blank png file in directory to draw on it
## following statement does the following:
## using plot2_df, take its date and time columns, combine and convert
## them to POSIXlt, plot POSIXlt value on x axis and Global Active power on y
## use line plot, and leave x axis label blank
with(plot2_df, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
                    Global_active_power,  
      ylab = "Global Active Power (kilowatts)", xlab = "",
      type = "l"))
dev.off()
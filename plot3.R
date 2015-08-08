library(sqldf) ## need sqldf library for filter read of file
library(datasets)  ## for the use of "with" below
plot3_df <- read.csv2.sql(file = "household_power_consumption.txt",
        sql = "select Sub_metering_1, Sub_metering_2,Sub_metering_3, Date, 
        Time from file where Date = '1/2/2007' or Date = '2/2/2007'")

png(file="plot3.png")  #create a blank png file in directory to draw on it
## following statement does the following:
## using plot2_df, take its date and time columns, combine and convert
## them to POSIXlt, plot POSIXlt value on x axis and Global Active power on y
## use line plot, and leave x axis label blank
with(plot3_df, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
             Sub_metering_1,ylab = "Energy sub metering", 
             xlab = "", type= "l", col="black"))

# using lines statements to add the other two columns as plots 
# on the same chart at the same scale
with(plot3_df, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
                      Sub_metering_2,  col="red"))
with(plot3_df, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
                      Sub_metering_3,  col="blue"))
legend("topright", col=c("black", "red", "blue",type = "l"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(1,1,1))
dev.off()
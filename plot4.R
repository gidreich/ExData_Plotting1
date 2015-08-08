library(sqldf) ## need sqldf library for filter read of file
library(datasets)  ## for the use of "with" below
plot4_df <- read.csv2.sql(file = "household_power_consumption.txt",
                          sql = "select Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2,Sub_metering_3, Global_active_power, Date, Time from file where Date = '1/2/2007' 
        or Date = '2/2/2007'")
png(file="plot4.png")  #create a blank png file in directory to draw on it
par(mfcol=c(2,2), mar=c(5,5,4,1))
#plot of global active power (almost same as plot 2)
with(plot4_df, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
                    Global_active_power,  
                    ylab = "Global Active Power", xlab = "",
                    type = "l"))
# plot of sub metering (almost same as plot 3)
with(plot4_df, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
                    Sub_metering_1,ylab = "Energy sub metering", 
                    xlab = "", type= "l", col="black"))
with(plot4_df, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
                     Sub_metering_2,  col="red"))
with(plot4_df, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
                     Sub_metering_3,  col="blue"))
legend("topright", col=c("black", "red", "blue",type = "l"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(1,1,1), bty="n")
with(plot4_df, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
                    Voltage, xlab = "datetime", type = "l"))

with(plot4_df, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), 
                    Global_reactive_power, xlab = "datetime", type = "l"))
dev.off()
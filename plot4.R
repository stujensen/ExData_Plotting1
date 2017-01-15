## Read the data
    x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Filter by 2007/2/1 and 2007/2/2 only, convert dates and times
    df <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")
    datetime <- strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Set better Names for selection
    colnames(df) <- c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3")

## Create the canvas for plots, then create plots on screen
    par(mfrow = c(2,2))
    ## upper left (same as plot2)
        plot(datetime, df$GAP, type="l", xlab = "", ylab = "Global Average Power")
    ## upper right
        plot(datetime, df$V, type="l", xlab = "datetime", ylab = "Voltage")
    ## lower left (same as plot3)
        plot(datetime, df$SM1, type = "n", xlab = "", ylab = "Energy Sub Metering")
            points(datetime, df$SM1, type = "l")
            points(datetime, df$SM2, type = "l", col = "red")
            points(datetime, df$SM3, type = "l", col = "blue")
            legend("topright", legend = c("Sub_metering_1","Sub_metering_2","sub_metering_3"), lwd = c(1,1,1), col = c("black", "red", "blue"))
    ## lower right
        plot(datetime, df$GRP, type="l", xlab = "datetime", ylab = "Global_reactive_power", col = "black")

## save a file to the working directory
    png(filename = "plot4.png", width = 480, height = 480)
    par(mfrow = c(2,2))
    ## upper left (same as plot2)
        plot(datetime, df$GAP, type="l", xlab = "", ylab = "Global Average Power")
    ## upper right
        plot(datetime, df$V, type="l", xlab = "datetime", ylab = "Voltage")
    ## lower left (same as plot3)
        plot(datetime, df$SM1, type = "n", xlab = "", ylab = "Energy Sub Metering")
            points(datetime, df$SM1, type = "l")
            points(datetime, df$SM2, type = "l", col = "red")
            points(datetime, df$SM3, type = "l", col = "blue")
            legend("topright", legend = c("Sub_metering_1","Sub_metering_2","sub_metering_3"), lwd = c(1,1,1), col = c("black", "red", "blue"))
    ## lower right
        plot(datetime, df$GRP, type="l", xlab = "datetime", ylab = "Global_reactive_power", col = "black")
    dev.off()

## end of file
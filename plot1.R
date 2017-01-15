## Read the data
    x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Filter by 2007/2/1 and 2007/2/2 only, convert dates and times
    df <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")
    df$Date <- as.Date(df$Date , "%d/%m/%Y")

## Set better Names for selection
    colnames(df) <- c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3")

## Create the Plot on screen
    par(mfrow = c(1,1))
    hist(df$GAP, col = "red", xlab = "Global Average Power (kilowatts)", main = "Global Active Power")

## save a file to the working directory
    png(filename = "plot1.png", width = 480, height = 480)
    hist(df$GAP, col = "red", xlab = "Global Average Power (kilowatts)", main = "Global Active Power")
    dev.off()

## end of file
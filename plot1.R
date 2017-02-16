plot1 <- 
        # read the raw data
        rawconsumption <- read.delim("household_power_consumption.txt", header=TRUE, sep = ";", dec = ".",stringsAsFactors = FALSE)
        
        # take data from the date range and lose the raw data from memory        
        plotdata <- subset(rawconsumption, Date == '1/2/2007'| Date == '2/2/2007')
        rm(rawconsumption)

        # get the plot data
        histdata <- as.numeric(plotdata$Global_active_power)
 
        # plot to a png file
        png("plot1.png", width = 480, height = 480)
        hist(histdata, breaks=12, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
        
        
        
    
        
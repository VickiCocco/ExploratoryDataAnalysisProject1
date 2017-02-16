plot2 <- 
        #install.packages("lubridate")
        #library(lubridate)
        # read the raw data
        rawconsumption <- read.delim("household_power_consumption.txt", header=TRUE, sep = ";", dec = ".",stringsAsFactors = FALSE)

        # take data from the date range and lose the raw data from memory        
        plotdata <- subset(rawconsumption, Date == '1/2/2007'| Date == '2/2/2007')
        rm(rawconsumption)

        # get the plot data
        powerdata <- as.numeric(plotdata$Global_active_power)
        
        timedata <- (dmy_hms(paste(plotdata$Date, plotdata$Time))) 

        # plot to a png file
        png("plot2.png", width = 480, height = 480)
        plot(timedata, powerdata, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        dev.off()

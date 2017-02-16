plot3 <- 
        #install.packages("lubridate")
        #library(lubridate)
        # read the raw data
        rawconsumption <- read.delim("household_power_consumption.txt", header=TRUE, sep = ";", dec = ".",stringsAsFactors = FALSE)

        # take data from the date range and lose the raw data from memory        
        plotdata <- subset(rawconsumption, Date == '1/2/2007'| Date == '2/2/2007')
        rm(rawconsumption)

        # get the plot data
        sub1data <- as.numeric(plotdata$Sub_metering_1)
        sub2data <- as.numeric(plotdata$Sub_metering_2)
        sub3data <- as.numeric(plotdata$Sub_metering_3)
        

        timedata <- (dmy_hms(paste(plotdata$Date, plotdata$Time))) 

        # plot to a png file
        png("plot3.png", width = 480, height = 480)
        plot(timedata, sub1data, 
             type = "l", 
             xlab = "", 
             ylab = "Global Active Power (kilowatts)")
        lines(timedata, sub2data, type = "l", col = "red")
        lines(timedata, sub3data, type = "l", col = "blue")
        legendlabels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        legendcolours <- c("black", "red", "blue")
        legendlines <- c(1,1,1)
        legend("topright", 
               legend = legendlabels, 
               col = legendcolours, 
               lty = legendlines)
        dev.off()

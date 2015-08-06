
# Load the data
file <- "data/household_power_consumption.txt"
data <- read.csv(file, header=TRUE, sep=";", na.strings="?")

# subset data to data from the dates 2007-02-01 and 2007-02-02
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

# convert data to Date/Time classes
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# plot settings
plotWidth <- 480
plotHeight <- 480
plotXLabel <- ""
plotYLabel <- "Energy sub metering"
line1Color <- "black"
line2Color <- "red"
line3Color <- "blue"

# set english locale for time
Sys.setlocale("LC_TIME", "English")

# PNG device
destFile <- "plot3.png"

# plot
plot(data$Date, data$Sub_metering_1, type="l", xlab=plotXLabel, ylab=plotYLabel, col=line1Color)
lines(data$Date, data$Sub_metering_2, type="l", col=line2Color)
lines(data$Date, data$Sub_metering_3, type="l", col=line3Color)
legend("topright", legend=names(data[7:9]), lty=1, col=c(line1Color, line2Color, line3Color))

# close device
dev.copy(png, file=destFile, width=plotWidth, height=plotHeight, units="px")
dev.off()

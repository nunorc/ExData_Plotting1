
# Load the data
file <- "data/household_power_consumption.txt"
data <- read.csv(file, header=TRUE, sep=";", na.strings="?")

# subset data to data from the dates 2007-02-01 and 2007-02-02
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

# convert data to Date/Time classes
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# layout
par(mfcol=c(2,2))

# set english locale for time
Sys.setlocale("LC_TIME", "English")

# PNG device
plotWidth <- 480
plotHeight <- 480
destFile <- "plot4.png"

# plot 1 - top left
plotXLabel <- ""
plotYLabel <- "Global Active Power"
plot(data$Date, data$Global_active_power, type="l", xlab=plotXLabel, ylab=plotYLabel)

# plot 2 - bottom left
plotXLabel <- ""
plotYLabel <- "Global Active Power"
line1Color <- "black"
line2Color <- "red"
line3Color <- "blue"

plot(data$Date, data$Sub_metering_1, type="l", xlab=plotXLabel, ylab=plotYLabel, col=line1Color)
lines(data$Date, data$Sub_metering_2, type="l", col=line2Color)
lines(data$Date, data$Sub_metering_3, type="l", col=line3Color)
legend("topright", legend=names(data[7:9]), lty=1, col=c(line1Color, line2Color, line3Color))

# plot 3 - top right
plotXLabel <- "Voltage"
plotYLabel <- "datetime"
plot(data$Date, data$Voltage, type="l", xlab=plotXLabel, ylab=plotYLabel)

# plot 4 - bottom right
plotXLabel <- "datetime"
plotYLabel <- "Global_reactive_power"
plot(data$Date, data$Global_reactive_power, type="l", xlab=plotXLabel, ylab=plotYLabel)

# close device
dev.copy(png, file=destFile, width=plotWidth, height=plotHeight, units="px")
dev.off()

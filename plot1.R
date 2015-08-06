
# Load the data
file <- "data/household_power_consumption.txt"
data <- read.csv(file, header=TRUE, sep=";", na.strings="?")

# subset data to data from the dates 2007-02-01 and 2007-02-02
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

# convert data to Date/Time classes
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# plot settings
plotColor <- "red"
plotWidth <- 480
plotHeight <- 480
plotTitle <- "Global Active Power"
plotXLabel <- "Global Active Power (kilowatts)"
plotYLabel <- "Frequency"

# PNG device
destFile <- "plot1.png"

# plot
hist(data$Global_active_power, col=plotColor, main=plotTitle, xlab=plotXLabel, ylab=plotYLabel, )

# close device
dev.copy(png, file=destFile, width=plotWidth, height=plotHeight, units="px")
dev.off()
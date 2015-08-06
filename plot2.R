
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
plotXLabel <- ""
plotYLabel <- "Global Active Power (kilowatts)"

# set english locale for time
Sys.setlocale("LC_TIME", "English")

# PNG device
destFile <- "plot2.png"

# plot
plot(data$Date, data$Global_active_power, type="l", xlab=plotXLabel, ylab=plotYLabel)

# close device
dev.copy(png, file=destFile, width=plotWidth, height=plotHeight, units="px")
dev.off()

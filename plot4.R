# Exploratory Data Analysis
# Coursera
# John Hopkins University

# set data dir and filename
filename <- "./Data/household_power_consumption.txt"
## Read household_power_consumption data
household_power_consumption <- read.table(filename,
                                          header = T,
                                          sep = ";",
                                          nrows = -1L,
                                          na.strings = "?",
                                          colClasses = c("character","character","numeric",
                                                         "numeric","numeric","numeric",
                                                         "numeric","numeric","numeric"))
# set dates of interest
date1 <- "1/2/2007"
date2 <- "2/2/2007"
# select data to plot related to the dates of interest
cond <- household_power_consumption$Date == date1 | household_power_consumption$Date == date2
plotdata <- household_power_consumption[cond,]

# convert date and time
datetime <- paste(data$Date,data$Time)
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
plotdata <- transform(plotdata, datetime = datetime)

# view resulting plot dataset
# View(plotdata)

# make the plot
png(filename = "./plots/plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))
with(data, plot(datetime, Global_active_power, ylab = "Global Active Power",
                type = "l", xlab = ""))
with(data, plot(datetime,Sub_metering_1, ylab = "Energy sub metering", type = "l",
                xlab = ""))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black","red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       bty = "n", lty = 1)
with(data, plot(datetime, Voltage, ylab = "Voltage", type = "l", xlab = "datetime"))
with(data, plot(datetime, Global_reactive_power, ylab = "Global_reactive_power",
                type = "l", xlab = "datetime"))
dev.off()
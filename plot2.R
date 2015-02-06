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
png(filename = "./plots/plot2.png", width = 480, height = 480, units = "px")
with(data, plot(datetime,Global_active_power, ylab = "Global Active Power (kilowatts)",
                type = "l", xlab = ""))
dev.off()
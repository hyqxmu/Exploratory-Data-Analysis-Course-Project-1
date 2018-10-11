#read the data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  colClasses = c("character", "character", rep("numeric", 7)),
                  na = "?")
dat$datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

#subset dat
dat_1 <- subset(dat, dat$Date >= "2007-02-01" & Date <= "2007-02-02")


#plot2: Global Active Power (kilowatts)
png("plot2.png", width = 480, height = 480)
plot(dat_1$datetime, dat_1$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()



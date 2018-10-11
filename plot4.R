#read the data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  colClasses = c("character", "character", rep("numeric", 7)),
                  na = "?")
dat$datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

#subset dat
dat_1 <- subset(dat, dat$Date >= "2007-02-01" & Date <= "2007-02-02")

#plot4:
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,2))
plot(dat_1$datetime, dat_1$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
plot(dat_1$datetime, dat_1$Voltage, 
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

plot(dat_1$datetime, dat_1$Sub_metering_1, col = "black", type = "l", 
     xlab = "", ylab = "Energy sub meeting")
lines(dat_1$datetime, dat_1$Sub_metering_2, col = "red", type = "l")
lines(dat_1$datetime, dat_1$Sub_metering_3, col = "blue", type = "l")
legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 1
)

plot(dat_1$datetime, dat_1$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")
dev.off()

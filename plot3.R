#read the data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  colClasses = c("character", "character", rep("numeric", 7)),
                  na = "?")
dat$datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

#subset dat
dat_1 <- subset(dat, dat$Date >= "2007-02-01" & Date <= "2007-02-02")


#plot3: Energy sub meeting
png("plot3.png", width = 480, height = 480)
plot(dat_1$datetime, dat_1$Sub_metering_1, col = "black", type = "l", 
     xlab = "", ylab = "Energy sub meetings")
lines(dat_1$datetime, dat_1$Sub_metering_2, col = "red", type = "l")
lines(dat_1$datetime, dat_1$Sub_metering_3, col = "blue", type = "l")
legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 1
)
dev.off()


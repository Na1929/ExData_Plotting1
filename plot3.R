#Change the language and load the file
Sys.setlocale("LC_TIME","en_US")
df <- read.csv("household_power_consumption.txt", sep = ";")

#Subset the data from 01-02-2007 through 02-02-2007
df2 <- subset(df, df$Date == "1/2/2007"| df$Date == "2/2/2007")

#Convert the character vector in Date into the date
df2$Date <- as.Date(df2$Date, "%d/%m/%Y")

#Convert the Sub_metering into numeric
df2$Sub_metering_1 <- as.numeric(as.character(df2$Sub_metering_1))
df2$Sub_metering_2 <- as.numeric(as.character(df2$Sub_metering_2))
df2$Sub_metering_3 <- as.numeric(as.character(df2$Sub_metering_3))

#Open graphic device and draw a plot
png("plot3.png", width = 480, height = 480)

#Create the new column in the dataframe, and combine Date and Time
df2$daytime <- with(df2, as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))

#Plot Sub_metering for DateTime and add the legend
plot(Sub_metering_1 ~ daytime, data = df2, type = "l", xlab ="", ylab = "Energy sub metering")
lines(df2$daytime, df2$Sub_metering_2, type = "l", col = "red")
lines(df2$daytime, df2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))
#Close graphic device
dev.off()

#Loading the file
df <- read.csv("household_power_consumption.txt", sep = ";")

#Subset the 01-02-2007 through 02-02-2007
df2 <- subset(df, df$Date == "1/2/2007"| df$Date == "2/2/2007")

#Convert the data in Date into the format of "YYYY-mm-dd"
as.numeric(as.factor(df2$Date))
strptime(df2$Date, format = "%d/%m/%Y")
df2$Date <- as.Date(df2$Date, format ="%d/%m/%Y")

#Convert into numeric
df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))

#Open graphic device and draw a plot
png("plot1.png", width = 480, height = 480)
hist(df2$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()

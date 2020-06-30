#Change the language and load the file
Sys.setlocale("LC_TIME","en_US")
df <- read.csv("household_power_consumption.txt", sep = ";")

#Subset the data from 01-02-2007 through 02-02-2007
df2 <- subset(df, df$Date == "1/2/2007"| df$Date == "2/2/2007")

#Convert the character vector in Date into the date
df2$Date <- as.Date(df2$Date, "%d/%m/%Y")

#Convert the Global_active_power into numeric
df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))

#Open graphic device and draw a plot
png("plot2.png", width = 480, height = 480)

#Create the new column in the dataframe, and combine Date and Time
df2$daytime <- with(df2, as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))

#Plot Global_active_power for DateTime
plot(Global_active_power ~ daytime, data = df2, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")

#Close graphic device
dev.off()

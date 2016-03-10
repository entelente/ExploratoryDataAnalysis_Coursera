if(!exists("em_data")) em_data <- readRDS("data/summarySCC_PM25.rds")

baltimore <- em_data[em_data$fips==24510,]
plotData <- aggregate(Emissions ~ year, baltimore, sum)
options(scipen=5)
png("R/plot2.png")
barplot(height=plotData$Emissions, names.arg = plotData$year, xlab = "Year", ylab = "total PM2.5 emission [t]", main = "Annual PM2.5 emission in Baltimore City")
dev.off()

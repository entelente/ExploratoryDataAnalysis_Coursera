if(!exists("em_data")) em_data <- readRDS("data/summarySCC_PM25.rds")

library(ggplot2)
baltimore <- em_data[em_data$fips==24510,]
plotData <- aggregate(Emissions ~ year + type, baltimore, sum)
options(scipen=5)
png("R/plot3.png")
ggplot(data=plotData, aes(year, Emissions, color=type)) + geom_line() + geom_point() + xlab("Year") + ylab("total PM2.5 emission [t]") + ggtitle("Annual PM2.5 emission change in Baltimore City by type")
dev.off()
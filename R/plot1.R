if(!exists("em_data")) em_data <- readRDS("data/summarySCC_PM25.rds")

# Total emission by year
totalByYear <- tapply(em_data$Emissions, em_data$year, FUN = sum)
totalByYear <- data.frame(year=names(totalByYear), emission=totalByYear)
options(scipen=5)
png("R/plot1.png")
barplot(height=totalByYear$emission, names.arg = totalByYear$year, xlab = "Year", ylab = "total PM2.5 emission [t]", main = "Annual PM2.5 emission")
dev.off()

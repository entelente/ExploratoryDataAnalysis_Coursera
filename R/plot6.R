if(!exists("em_data")) em_data <- readRDS("data/summarySCC_PM25.rds")
if(!exists("scc_data")) scc_data <- readRDS("data/Source_Classification_Code.rds")

# Slow operation :(
if(!exists("mergedInput")) mergedInput <- merge(em_data, scc_data, by="SCC")

library(ggplot2)
onRoad <- mergedInput[grepl(".*Onroad.*", mergedInput$Data.Category),]
onRoad <- onRoad[(onRoad$fips=="24510"|onRoad$fips=="06037"),]
plotData <- aggregate(Emissions ~ year + fips, onRoad, sum)
plotData$fips[plotData$fips=="24510"] <- "Baltimore City"
plotData$fips[plotData$fips=="06037"] <- "Los Angeles County"
png("R/plot6.png")
ggplot(data=plotData, aes(year, Emissions, color=fips)) + geom_point() + geom_line() + xlab("Year") + ylab("total PM2.5 emission [t]") + ggtitle("Annual PM2.5 emission change from motor vehicle sources in Baltimore City by type") + scale_colour_discrete(name="Cities")
dev.off()

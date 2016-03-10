if(!exists("em_data")) em_data <- readRDS("data/summarySCC_PM25.rds")
if(!exists("scc_data")) scc_data <- readRDS("data/Source_Classification_Code.rds")

# Slow operation :(
if(!exists("mergedInput")) mergedInput <- merge(em_data, scc_data, by="SCC")

library(ggplot2)
onRoad <- mergedInput[grepl(".*Onroad.*", mergedInput$Data.Category),]
onRoad <- onRoad[onRoad$fips==24510,]
plotData <- aggregate(Emissions ~ year, onRoad, sum)
png("R/plot5.png")
ggplot(data=plotData, aes(factor(year), Emissions)) + geom_bar(stat="identity") + xlab("Year") + ylab("total PM2.5 emission [t]") + ggtitle("Annual PM2.5 emission change from motor vehicle sources in Baltimore City")
dev.off()

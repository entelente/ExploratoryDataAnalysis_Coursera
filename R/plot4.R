if(!exists("em_data")) em_data <- readRDS("data/summarySCC_PM25.rds")
if(!exists("scc_data")) scc_data <- readRDS("data/Source_Classification_Code.rds")

# Slow operation :(
if(!exists("mergedInput")) mergedInput <- merge(em_data, scc_data, by="SCC")

library(ggplot2)
coal <- mergedInput[grepl(".*[Cc]oal.*", mergedInput$Short.Name),]
plotData <- aggregate(Emissions ~ year, coal, sum)
png("R/plot4.png")
ggplot(data=plotData, aes(factor(year), Emissions)) + geom_bar(stat="identity") + xlab("Year") + ylab("total PM2.5 emission [t]") + ggtitle("Annual PM2.5 emission change from coal combustion-related sources")
dev.off()

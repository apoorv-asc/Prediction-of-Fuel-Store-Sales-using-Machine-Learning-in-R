#####################################################################
# Description:
# Plot the weekly sales (also save in png format) for varying depts.
#####################################################################


rm(list=ls(all=TRUE))
gc(reset=TRUE)



setwd("E:/Studies/6th_Semester/Walmart-Store-Sales-Forecasting/")
require(lattice)

load('./data/training_testing_data_v1.RData')


figure_format <- 'png'

for(dept in sort(unique(sort(dfTrain$Dept)))){
  filePath <- './visualization/weekly_sales'
  dir.create(filePath, showWarnings=FALSE, recursive=TRUE)
  if(figure_format=='pdf'){
    pdf(paste(filePath, '/Dept', dept,'.pdf', sep=''))
  }else if(figure_format=='png'){
    png(paste(filePath, '/Dept', dept,'.png', sep=''))
  }
  
  dfTrain2 <- subset(dfTrain, Dept==dept)
  # create scatter plot
  print(xyplot(log(Weekly_Sales)~Day_Index|Store,
               data=dfTrain2, main=paste('Dept: ', dept, sep=''), as.table=TRUE,
               strip = strip.custom(strip.names = TRUE, strip.levels = TRUE),
               par.strip.text = list(cex = 0.75)))
  dev.off()
}
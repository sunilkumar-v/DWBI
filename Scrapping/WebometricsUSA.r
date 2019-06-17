library(htmltab)

url <- "http://www.webometrics.info/en/North_america/United%20States%20of%20America"
usaWebO <- htmltab(doc = url,which=1,rm_nodata_cols = T)


for(n in 1:12){
  url <- paste0("http://www.webometrics.info/en/North_america/United%20States%20of%20America?page=",n)
  usaWebO <-rbind(usaWebO,htmltab(doc = url,which=1,rm_nodata_cols = T))
}

usaWebO_ID <- c(1:1300)
usaWebO_Rankings <- data.frame(usaWebO_ID,usaWebO)
colnames(usaWebO_Rankings)[4] <- 'Presence_Rank'
colnames(usaWebO_Rankings)[5] <- 'Impact_Rank'
colnames(usaWebO_Rankings)[6] <- 'Openness_Rank'
colnames(usaWebO_Rankings)[7]<- 'Excellence_Rank'
write.csv(usaWebO_Rankings, file = "usaWebO_Rankings.csv",row.names=FALSE)


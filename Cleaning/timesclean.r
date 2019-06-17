times <- read.csv(file="E:/DWBI PROJECT/TimesUsRanks.csv")
cwur <- read.csv(file="E:/DWBI PROJECT/edited/CWURRANKINGUSA.csv")
colnames(cwur)[2]<-"UniversityName"
colnames(times)[2]<-"UniversityName"

UniversityNameS <- as.vector(cwur$UniversityName)
timesNames<-as.vector(times$UniversityName)
cwurNames<-tolower(UniversityNameS)
timesNames<-tolower(timesNames)
cwurNames = gsub('[[:cntrl:]]', '', cwurNames)
timesNames = gsub('[[:cntrl:]]', '', timesNames)
timesNames = gsub("\\d", '', timesNames)
cwurNames = gsub("\\d", '', cwurNames) 
timesNames = gsub('[[:punct:]]', '', timesNames)
cwurNames = gsub('[[:punct:]]', '', cwurNames)
cwurNames = gsub("^[[:space:]]*","",cwurNames)
timesNames = gsub("^[[:space:]]*","",timesNames)
cwurNames<-gsub("[[:space:]]*$","",cwurNames)
timesNames<-gsub("[[:space:]]*$","",timesNames)
cwurNames = gsub(' +',' ',cwurNames)
timesNames = gsub(' +',' ',timesNames)


matched<-c()
require(stringdist)
require(stringr)
for(name in  cwurNames ) {
  index<-amatch(name,timesNames)
  matched<-c(matched,index)
}
matched <- matched[!is.na(matched)]
timesdata<-times[matched,]
write.csv(timesdata,file="E:/DWBI PROJECT/Final/TimesFinal1.csv",row.names = F)







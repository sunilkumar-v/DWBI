webo <- read.csv(file="E:/DWBI PROJECT/edited/usaWebO_Rankings.csv")
cwur <- read.csv(file="E:/DWBI PROJECT/edited/CWURRANKINGUSA.csv")
colnames(cwur)[2]<-"UniversityName"
colnames(webo)[3]<-"UniversityName"

UniversityNameS <- as.vector(cwur$UniversityName)
weboNames<-as.vector(webo$UniversityName)
cwurNames<-tolower(UniversityNameS)
weboNames<-tolower(weboNames)
cwurNames = gsub('[[:cntrl:]]', '', cwurNames)
weboNames = gsub('[[:cntrl:]]', '', weboNames)
weboNames = gsub("\\d", '', weboNames)
cwurNames = gsub("\\d", '', cwurNames) 
weboNames = gsub('[[:punct:]]', '', weboNames)
cwurNames = gsub('[[:punct:]]', '', cwurNames)
cwurNames = gsub("^[[:space:]]*","",cwurNames)
weboNames = gsub("^[[:space:]]*","",weboNames)
cwurNames<-gsub("[[:space:]]*$","",cwurNames)
weboNames<-gsub("[[:space:]]*$","",weboNames)
cwurNames = gsub(' +',' ',cwurNames)
weboNames = gsub(' +',' ',weboNames)


matched<-c()
require(stringdist)
for(name in  cwurNames ) {
  index<-amatch(name,weboNames)
  matched<-c(matched,index)
}
matched <- matched[!is.na(matched)]
webodata<-webo[matched,]
write.csv(webodata,file="E:/DWBI PROJECT/Final/webodata.csv",row.names = F)





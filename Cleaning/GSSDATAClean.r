RandD <- read.csv(file="E:/DWBI PROJECT/edited/R&Dfiltered.csv")
cwur <- read.csv(file="E:/DWBI PROJECT/edited/CWURRANKINGUSA.csv")
colnames(cwur)[2]<-"UniversityName"
colnames(GSS)[1]<-"UniversityName"
UniversityNameS <- as.vector(cwur$UniversityName)
RandDNames<-as.vector(RandD$UniversityName)
cwurNames<-tolower(UniversityNameS)
RandDNames<-tolower(RandDNames)
cwurNames = gsub('[[:cntrl:]]', '', cwurNames)
RandDNames = gsub('[[:cntrl:]]', '', RandDNames)
RandDNames = gsub("\\d", '', RandDNames)
cwurNames = gsub("\\d", '', cwurNames) 
RandDNames = gsub('[[:punct:]]', '', RandDNames)
cwurNames = gsub('[[:punct:]]', '', cwurNames)
cwurNames = gsub("^[[:space:]]*","",cwurNames)
RandDNames = gsub("^[[:space:]]*","",RandDNames)
cwurNames<-gsub("[[:space:]]*$","",cwurNames)
RandDNames<-gsub("[[:space:]]*$","",RandDNames)
cwurNames = gsub(' +',' ',cwurNames)
RandDNames = gsub(' +',' ',RandDNames)


matched<-c()
require(stringdist)
for(name in  cwurNames ) {
  index<-amatch(name,RandDNames)
  matched<-c(matched,index)
}
matched <- matched[!is.na(matched)]
RandDdata<-RandD[matched,]
write.csv(RandDdata,file="E:/DWBI PROJECT/Final/R&Ddata.csv",row.names = F)







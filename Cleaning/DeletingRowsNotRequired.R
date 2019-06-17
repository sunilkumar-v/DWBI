times <- read.csv(file="E:/DWBI PROJECT/edit/TimesFinal.csv")
webo <-read.csv(file = "E:/DWBI PROJECT/edit/webodata.csv")
Gss<-read.csv(file = "E:/DWBI PROJECT/edit/GSSdata.csv")
RandD<-read.csv(file="E:/DWBI PROJECT/edit/R&Ddata.csv")
sentiment<-read.csv(file="E:/DWBI PROJECT/edit/UNIVSentiment.csv")

forbesNmaes<-Forbes$UniversityName

del<-c(1,3,4,6,16,19,21,41,43,44,50,56,65,81,85,86,94,95,98,101,104,106,108,109,113,114,119,122,129,136,139,140,146,153,154,155,157,158,159,161,162,167,168,169,173,185,186,187,188,190,191,196,197,198,203)

web1<-webo[-(del),]
timesNames<-as.vector(times$University)
CleanNames(timesNames)
CleanNames(forbesNmaes)
forbesNmaes<-as.vector(forbesNmaes)
timesmatched<-c()
for(name in forbesNmaes) {
  timesindex<-amatch(name,)
  timesmatched<-c(timesmatched,timesindex)
}

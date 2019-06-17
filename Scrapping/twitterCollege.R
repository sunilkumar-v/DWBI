library(plyr)
library(httr)
library(doBy)
library(Quandl)
library(twitteR)
library(plyr)
library(stringr)

api_key <- "7dCGHoEJBM8L8v3IVsIXRmA1m"
api_secret <- "cuM37F3r0fQLJV1aom3Wt6rCac2GuIadeOAO9EvWvH0TTBJc9k"
access_token <- "908602493969604608-jlwvgDA7c1pP3rL5CIwcuuMsVTt0Fo3"
access_token_secret <- "HAe2oTYoycOhcfu8VztmfKsTLFRJERctEbYT2CTF7ZfDQ"

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
poswords = scan('E:/DWBI PROJECT/positivewords.txt', what='character', comment.char=';')
negwords = scan('E:/DWBI PROJECT/negativewords.txt', what='character', comment.char=';')
times <- read.csv(file="E:/DWBI PROJECT/edited/timesfiltered.csv", header=TRUE, sep=",")
MyData <- times[1:500,]
colleges <- MyData$UniversityName
colleges<-as.vector(colleges)
twittersentiment1 <- data.frame(College=character(0),TweetsConsidered=numeric(0),Positive=numeric(0),Negative=numeric(0),PositiveScore=numeric(0),NegativeScore=numeric(0))

for(college in colleges){
 #searchTerm <- paste0("@",college," OR ","#",college)
  # get tweets
  try({
  tweets <- searchTwitter(college, n =1500)
  tweets <- strip_retweets(tweets)
  tweetsCount<-length(tweets)
  tweets <- twListToDF(tweets)
  tweetTexts <- as.vector(tweets$text)
  tweetTexts = gsub('http\\S+\\s*', '', tweetTexts) ## Remove URLs
  tweetTexts = gsub('\\b+RT', '', tweetTexts) ## Remove RT
  tweetTexts = gsub('#\\S+', '', tweetTexts) ## Remove Hashtags
  tweetTexts = gsub('@\\S+', '', tweetTexts) ## Remove Mentions
  tweetTexts = gsub('[[:cntrl:]]', '', tweetTexts) ## Remove Controls and special characters
  tweetTexts = gsub("\\d", '', tweetTexts) ## Remove Controls and special characters
  tweetTexts = gsub('[[:punct:]]', '', tweetTexts) ## Remove Punctuations
  tweetTexts = gsub("^[[:space:]]*","",tweetTexts) ## Remove leading whitespaces
  tweetTexts = gsub("[[:space:]]*$","",tweetTexts) ## Remove trailing whitespaces
  tweetTexts = gsub(' +',' ',tweetTexts) ## Remove extra whitespaces
  tweetTexts = tolower(tweetTexts)
  wordlist = strsplit(tweetTexts, '\\s+')
  allwords = unlist(wordlist)
  allwords <-as.vector(allwords)
  Poswords <- sum(table(allwords[allwords %in% poswords]))
  NegWords <- sum(table(allwords[allwords %in% negwords]))
  total <- sum(Poswords,NegWords)
  postiveScore <- (100*(Poswords/total))
  negativeScore<-(100*(NegWords/total))
  twitterReview <- data.frame(college,tweetsCount,Poswords,NegWords,postiveScore,negativeScore)
  twittersentiment1 <- rbind(twittersentiment1,twitterReview)
  })
}
                
write.csv(twittersentiment1,file="E:/DWBI PROJECT/UNIVSentiment.csv",row.names = F)

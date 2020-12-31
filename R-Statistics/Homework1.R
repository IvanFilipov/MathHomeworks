#45031

Y=1
X=3

attach(survey)

myData = survey[c(Y*15:(Y*15+100)),]

#full info about the oldest lady A
maxAge = max(myData$Age[Sex == "Female"],na.rm = T)
print('A:')
print(myData[which(myData$Age == maxAge),])

#B
SortedData<-na.omit(myData[rev(order(myData$Height)),])
print('B:')
print(SortedData$Sex[1])
print(SortedData$Sex[2])
print(SortedData$Sex[3])
print(SortedData$Sex[4])

#C
AvrPusle = mean(myData$Age[which(myData$Pulse > 80)])
print('C:')
print(AvrPusle)

#D
SportH = sum(na.omit(myData$Height[which(myData$Exer == "Freq")] > 175))
print('D:')
print(SportH)

#E
#boxplot(myData$Height ~ myData$Exer)
NoneToHeight = mean(na.omit(myData$Height[myData$Exer == "None"]))
FreqToHeight = mean(na.omit(myData$Height[myData$Exer == "Freq"]))
SomeToHeight = mean(na.omit(myData$Height[myData$Exer == "Some"]))

sdNone = sd(na.omit(myData$Height[myData$Exer == "None"]))
sdFreq = sd(na.omit(myData$Height[myData$Exer == "Freq"]))
sdSome = sd(na.omit(myData$Height[myData$Exer == "Some"]))

DispNoneToHeight = var((na.omit(myData$Height[myData$Exer == "None"]))) #sdNone*sdNone
DispSomeToHeight = sdSome*sdSome
DispFreqToHeight = sdFreq*sdFreq

#F
#cor(myData$Height,myData$Pulse,use="pairwise.complete.obs")
#[1] -0.1470715

#cor(myData$Height,myData$Wr.Hnd,use="pairwise.complete.obs")
#[1] 0.5848159

# cor(myData$Height,myData$Age,use="pairwise.complete.obs")
#[1] -0.03226079

line = lm(myData$Height~myData$Wr.Hnd)
#plot(myData$Wr.Hnd,myData$Height)
#abline(line)

#G
plot(myData$Smoke,myData$Exer)







X = 3
Y = 1
XY = 31

#task 1

start = XY*50

myData = homedata[start:(start+49),]

yy1970 = myData$y1970
yy2000 = myData$y2000

shapiro.test(yy2000)
shapiro.test(yy1970) #-> ne sa normalno razpredeleni

testing1970 = wilcox.test(yy1970,conf.level = 0.97 ,conf.int = T)
testing2000 = wilcox.test(yy2000,conf.level = 0.97 ,conf.int = T)

#print(testing1970$conf.int)
#print(testing2000$conf.int)

wilcox.test(yy1970,yy2000,alternative = "two.sided",paired = F) #-> small p-val -> nothing in common


#task 2

rains = c(8.9 ,6.4 ,12.8 ,9.6 ,13.8 ,16.1 ,12.4 ,12.8 ,11.8 ,16.0 ,7.4 ,12.5)
harvest = c(306.2 ,272.5 ,385.0 ,392.5 ,400.0 ,531.2 ,415.0 ,407.5 ,373.7 ,493.7 ,325.0 ,400.0)

l = lm(harvest ~ rains)
newHarvest = predict(l,data.frame( rains = Y+1))

print(newHarvest)

sm = summary(l)

# Ho : B1 = 24
# H1 : B1 < 24

b1 = sm$coefficients[2,1]
se = sm$coefficients[2,2]

ts = (b1 - 24) / se

pval = pt(ts,df = length(rains-2)) # pval = 0.20 -> Ho


#task 3 

firstPr = c(39,50, 61, 67, 40, 40, 54)
secondPr = c( 60, 53, 42, 41, 40, 54, 63, 69)

shapiro.test(firstPr)
shapiro.test(secondPr) #both have normal distribution

wilcox.test(firstPr,secondPr , alternative = "less",var.equal = F)
#pval = 0.2427 => Ho => equal

#task 4

workingILL = 12
workingNotILL = 520 - workingILL
notworkingILL = 48 - workingILL
notworikngNotILL = 5000 - 520 - notworkingILL
  
mm = cbind(c(notworkingILL,workingILL),
           c(notworikngNotILL,workingNotILL))

chisq.test(mm) #p-val = 0.001988 => H1 => dependancy

#task 5

A = rexp(100,1/X)

B = rexp(100,1/X)

C = A/ (A+B)

t = table(cut(C,breaks = c(seq(0,1,0.25))))

print(t)

hist(C,ylim = c(0,35) , xlim = c(0,1) , breaks = c(seq(0,1,0.25)), labels = T )

in1 = 25 - sum(C<0.25)
in2 = 25 - sum(C<0.50 & C >0.25)
in3 = 25 - sum(C<0.75 & C > 0.50)
in4 = 25 - sum(C< 1 & C > 0.75)

tStat = (in1*in1 + in2*in2 + in3*in3 + in4*in4) / 25

pchisq(tStat , 99, lower.tail = F)    

chisq.test(C)


p = 1 - phyper(1,4,28,5)

times =20

Try=rhyper(times,4,28,5)

pTry = sum(Try > 1)/times 


qqnorm(Try) 
qqline(Try)

#t = wilcox.test(Try , conf.level = 0.92,exact=FALSE, conf.int=TRUE)

t1 = prop.test(sum(Try>1) , 20,conf.level = 0.92)

print(t1$conf.int)



f = function ( x , n){
  
  sum = 0
  
  for (i in 1:n){
    
    sum = sum + (`^`(x,i) / i)
    
  }
  
  return(sum)
  
}

g = function (X,Y){
  
  for(i in X)
  
  
  
}
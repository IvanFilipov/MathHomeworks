
X=3
Y=1


Mclac = function(x){
  
  minCols = apply(x,2,min)
  maxCols = apply(x,2,max)
  
  MCols = maxCols-minCols
  
  return(MCols)
  
}


MatrixSolve = function(m){
  
  if(!is.matrix(m)){
    return (-1)
  }

  
  return (m[,order(Mclac(m))])
  

}

#A
MatrixGen = function(nrows = 20 , ncols = 80){
  
  
  arr  = c(X:(X+Y+5))
  
  Ex = mean(arr)
  ExPow = mean(arr*arr)
  Disp = ExPow - Ex*Ex
  
  sd = sqrt(Disp)
  
  return(matrix(rnorm(nrows*ncols,Ex,sd),nrows,ncols))
  
}

#B
sm = MatrixSolve((MatrixGen()))

#C
boxplot(sm[,1],sm[,79])

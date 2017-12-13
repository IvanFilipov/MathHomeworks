function [y] = k5_forward(tao, h, mu1, mu2, f_inl)
  
  x = 0:h:1;
  t = 0:tao:2;
  
  n = size(x)(2);
  m = size(t)(2);
  
  y = zeros(m,n);
  
  %начално 
  for i = 1 : n
    
    y(1,i) = x(i)*x(i)*0.5 - x(i);
    
  endfor
  
  %гранично отляво
  for j = 1 : m
  
     y(j,1) = 0 ;
  
  endfor
  
  gama = tao / (h * h );
  
  for j = 2 : m 
      
      for i = 2 : n - 1     
        
          f = feval(f_inl, x(i) , t(j-1));
      
          % j + 1- > j  
          y(j, i) = y(j-1, i) + gama * ( y(j-1, i+1) - 2 * y(j-1, i) + y (j-1, i-1) )  + tao * f ; 
                   
      endfor
      
      f = feval(f_inl, x(n) , t(j-1));
      y(j, n) = y(j-1, n) - 2 * gama * ( y( j-1, n) - y (j-1, n -1)) + tao * f;   
      
  endfor
    
endfunction
  
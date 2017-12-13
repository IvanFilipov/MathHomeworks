function [y] = k5_backward(tao, h, f_inl)
  
  x = 0:h:1;
  t = 0:tao:2;
  
  n = size(x)(2);
  m = size(t)(2);

  y = zeros(m, n);
  
  M = zeros(n + 1);

  M(1, 1) = -1; % yi0
  
  gama = tao / (h * h);
  
  
  for i =  2 : n
   
    M(i, i - 1) = gama;
    M(i, i) = 1 + 2*gama;
    M(i, i + 1) = gama;
    i=i+1;
    
  endfor
  
  M(n + 1,n + 1) = -1; % uoj
  
  for i = 1 : n
    
    y(1,i) = x(i)*x(i)*0.5 - x(i);
    
  endfor
  
  for j = 2  : m
   
    y(j, 1) = 0;
    
    fj = zeros(n + 1);
    
    fj(1) = 0;
      
    for i = 2 :  n - 1
                                            
      fj(i) = -feval(f_inl, x(i), t(j)) * tao- y(j-1,i);
      % j -> j + 1
    endfor
    
    
    y(j, n) = y(j - 1, n) - 2 * gama * ( y(j-1, n ) - y(j-1,n-1) ) + tao * fj(n);
    
    fj(n + 1) = y(j, n);
    

    y(j,:) = progonka(M,fj);
         
  endfor
  
endfunction
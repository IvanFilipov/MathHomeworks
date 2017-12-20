function [y] = k6_method(f_inl, h, eps)
  
  x = 0:h:1;
  
  n = size(x)(2);

  y = zeros(n,n);
  
  yold = ones(n,n);
  
  
  f = zeros(n , n);
  %first feval
  for i = 2 : (n-1)
      
      for j = 2 : (n-1)
        
        f(i, j) = feval(f_inl, x(i), x(j));
        
      endfor
      
    endfor
  
  
  k = 0;
  while(!check(y, yold, eps, n))
  
    k = k + 1;
    yold = y;
    
    for i = 2 : (n-1)
      
      for j = 2 : (n-1)
        
        y(i,j) = (yold(i-1,j) + yold(i+1,j) + yold(i, j -1) + yold(i, j + 1) + (h*h*f(i, j)))/4;
        
      endfor
      
    endfor
    
    
  endwhile
  
  printf("%d\n",k);
endfunction

function [res] = check(y, yold, eps, n)
  
%res = false;
%  
%  maxY = max(max(y));
%  
%  if(maxY == 0)
%   
%      return;
%  
%  endif
%  
%  
%  maxDiff = max(max( y .- yold ));
%  
%  if( abs(maxDiff) / abs(maxY) < eps )
%        
%      res = true;  
%      return;
%      
%  endif
  
  
  res = true;
  for i = 2 : (n-1)
    for j = 2 : (n-1)
      
      if( (abs(y(i, j) - yold(i, j))) >= eps )
         res = false;
         return 
      endif
      
    endfor
  endfor
  
endfunction
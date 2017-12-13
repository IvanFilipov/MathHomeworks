function [yi] = progonka(M, f)
  
  N = size(M)(2) - 2;
  
  alfa = zeros(1,N);
  beta = zeros(1,N + 1);
  
  alfa(1) = M(1,2)/M(1,1);
  beta(1) = -f(1)/M(1,1);
  
  i = 1;
  
  while(i <= N)
    ai = M(i + 1, i);
    ci = M(i + 1, i + 1);
    bi = 0;
    
    if(i < N)
      bi = M(i + 1, i + 2);
    endif
    
    denominator = ci - alfa(i)*ai;
    
    if i < N
      alfa(i + 1) =  bi / denominator;
    endif
    
    beta(i + 1) = (-f(i + 1) + ai*beta(i)) / denominator;
    i = i + 1;
    
  endwhile
  
  yi = zeros(1,N + 1);
  
  yi(N + 1) = beta(N + 1);
  
  i = N;
  
  while(i > 0 )
    yi(i) = alfa(i)*yi(i + 1) + beta(i);
    i = i - 1;
  endwhile
  
endfunction
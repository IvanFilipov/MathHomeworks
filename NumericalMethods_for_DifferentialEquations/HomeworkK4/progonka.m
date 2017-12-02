function [xi yi] = progonka (F_inl, q_inl, a, b, m1 , m2 , N)


%creating the the three - diagonal matrix 
  
  h = (b - a) / N;
  
  matrix = zeros(N + 1);
  f = zeros(N + 1 , 1);
  
  %f0 = feval(F_inl, a);
  %q0 = feval(q_inl, a);
  
  c0 = 1;
  b0 = 0;
  
  f(1) = -m1;
  
  matrix(1,1) = c0;
  matrix(1,2) = b0;
  
  i = 2;
  xi = a:h:b;
  
  while(i <= N)
  
    fi = feval(F_inl, xi(i));
    qi = feval(q_inl, xi(i));
    
    %ai
    matrix(i, i - 1) = 1;
    
    %ci
    matrix(i, i) = ((h ^ 2) * qi) + 2;
    
    %bi
    matrix(i, i + 1) = 1;
    
    %fi
    f(i) = - fi * (h ^ 2) ;
    
    i=i+1;
  end
  
  %an
  matrix(N + 1,N) = 1;
  
  qn = feval(q_inl,b);
  %cn
  matrix(N + 1,N + 1) = (2 + (h ^ 2) * qn) / 2;
  
  fn = feval(F_inl,b);
  
  %fn
  f(N + 1) = (-m2)*h - (((h ^ 2) / 2) * fn); 
  
  
%calculating alpha and beta

  alpha = zeros(1,N);
  beta = zeros(1,N + 1);
  
  alpha(1) = matrix(1,2)/matrix(1,1);
  beta(1) = -f(1)/matrix(1,1);
  
%forward
  i = 1;
  while(i <= N)
  
    ai = matrix(i + 1, i);
    ci = matrix(i + 1, i + 1);
    bi = 0;
    
    if(i < N)
      bi = matrix(i + 1, i + 2);
    end
    
    denom = ci - alpha(i)*ai;
    
    if (i < N)
      alpha(i + 1) =  bi / denom;
    end
    
    beta(i + 1) = (-f(i + 1) + ai*beta(i)) / denom;
    i = i + 1;
    
  end
  
  %backward calculating yi 
  
  yi = zeros(1,N + 1);
  
  %yn 
  yi(N + 1) = beta(N + 1);
  
  
  i = N;
  while(i > 0 )
    yi(i) = alpha(i)*yi(i + 1) + beta(i);
    i = i - 1;
  end  
  
endfunction

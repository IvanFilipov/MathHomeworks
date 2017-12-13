f = '(-e^(-t)) * ( x * x * 0.5 - x + 1)';
f_inl = inline(f,'x','t');

%точното решение
u = '(e^(-t))*(x*x*0.5 - x)';
u_inl = inline(u, 'x','t');
 
%file print

tao = 0.5; %tao =0.005; for forward method tao / h * h  < 1 / 2 !!! 
h = 0.1;

x = 0 : h : 1;
t = 0 : tao : 2;

n = size(x)(2);
m = size(t)(2);

%uout = zeros(m,n);

for j = 1 : m
    for i = 1 : n
      
      uout(j,i) = feval(u_inl, x(i), t(j));
    
    endfor
endfor

%намира приближение чрез чисто неявна диференчна схема
ybackward = k5_backward(tao, h, f_inl);

%намира приближение на решението чрез явна схема
%yforward = k5_forward(tao,h,0,0,f_inl);


eps = abs(uout - ybackward);
%eps = abs(uout - yforward);

output = fopen("./output.txt", "w");

for j = 1 : m
  
    fprintf(output, "TIME = %f\n", t(j));
    
    fprintf(output, "xi       , u(xi,t)  , y(xi,t)   , eps = u(xi, t) - y(xi, t)\n");
    
    for i = 1 : n
                                                                            %change here with yforward
      fprintf(output, "%f, %f , %f , %f\n", x(i) , uout(j, i),ybackward(j, i) ,eps(j ,i));
      
    endfor
    
    fprintf(output, "\n\n");
    
endfor

fclose(output);


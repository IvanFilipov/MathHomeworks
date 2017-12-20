f='x1+cos(3*x2)' ; %+x1^2 + 2*x2';
f_inl = inline(f,'x1', 'x2');

N = 10;

h=1/N;

eps = 10 ^ (-3);

x=0:h:1;
n = size(x)(2);

[y] = k6_method(f_inl, h, eps);

yH = y(1:n,1:n);
xxx=0:h:1;
yyy=0:h:1;
[xi,yi]=meshgrid(xxx,yyy);
mesh(xi,yi,y)


[y1] = k6_method(f_inl, h/2, eps);
[y2] = k6_method(f_inl, h/4, eps);

yH2 = y1(1:2:2*n, 1:2:2*n);
yH4 = y2(1:4:4*n, 1:4:4*n);

alpha = [];

for i = 2: (n - 1)
  for j = 2: (n - 1)
    
    newalpha = log(abs((yH(i, j) + yH2(i, j))/(yH2(i, j) + yH4(i, j))))/log(2);
    alpha = [alpha newalpha];
    
  endfor  
  
  %printf("\n");
  
endfor

alpha'



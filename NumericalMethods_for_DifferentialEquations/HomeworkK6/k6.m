f='x1+x2'

h=1/10;

eps = 0.00001;

x=0:h:1;
n = size(x)(2);

[y] = k6_method(f,h,eps);
[y1] = k6_method(f,h/2,eps);
[y2] = k6_method(f,h/4,eps);

alfa = [];
for i = 2:(n - 1)
  for j = 2:(n-1)
    newalfa = log(abs((y(i,j) + y1(2*i-1,2*j-1))/(y1(2*i-1,2*j-1) + y2(2*(i-1) - 1,2*(j-1) - 1))))/log(2);
    alfa = [alfa newalfa];
  end
end

alfa'
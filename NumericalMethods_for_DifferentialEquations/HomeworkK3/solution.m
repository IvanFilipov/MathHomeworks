
F = '((t + y)^2)/((t + y)^2 + 1)';
F_inl = inline(F, 't', 'y');
y0 = 0;

a = 0.6;
N = 12;
Eps = 0.001;
h = a/N;

[x y] = rk2(F_inl, [0 h], y0, h);


%predictor calcs
%coeff
b1 = 3;
b2 = -1;

i = 2;

while  (x(i) < a)
  %fi
  fi1 = feval(F_inl, x(i), y(i));
  %fi-1 
  fi2 = feval(F_inl, x(i-1), y(i-1));
  
  %y/i+1/ = 
  ynext = y(i) + (h/2)*(b1*fi1 + b2*fi2);
  xnext = x(i) + h;
  y = [y; ynext];
  x = [x; xnext];
  i = i + 1;
end



%corrector calcs

c0 = 1;
c1 = 4;
c2 = 1;

yCorrector = y;
it = 0;

breakCond = false;

while (it < 3 || not(breakCond))
    
  beg = x(1);
  xend = x(end);
  
  i = 3;
  yold = yCorrector;
  
  breakCond = true;
  
  while (beg + (i-1)*h < xend)
    %f/i + 1/
    fi1 = feval(F_inl, x(i), yCorrector(i));
    %fi
    fi2 = feval(F_inl, x(i-1), yCorrector(i-1));
    %f/i-1/
    fi3 = feval(F_inl, x(i-2), yCorrector(i-2));
    
    yold = yCorrector(i);
    yCorrector(i) = yCorrector(i-2) + (h/3)*(c0*fi1 + c1*fi2 + c2*fi3);
    
    
    if(abs(yCorrector(i) - yold) > Eps)
      breakCond = false;
    end
    
    i = i + 1;
  end
  
  
  it = it + 1;
end


[xout,yout] = rk2(F_inl, [0 a], y0 ,h);

%rk2
plot(xout,yout,'Color',[1,0,0]);
hold on;

%predictor
plot(x,y,'Color',[1,1,0]);

%corector
plot(x,yCorrector,'Color',[1,0,1]);



table = [x,yCorrector]
it




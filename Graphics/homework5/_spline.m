%given x0 x1 x2 x3 y0 y1 y2 y3
%color

h1 = x1 - x0;
h2 = x2 - x1;
h3 = x3 - x2;

%естествен сплайн

a1 = y0;
a2 = y1;
a3 = y2;


l1 = 0;
l4 = 0;


%coeff eval
_a = 2 * (h1 + h2);
_b = h2;
_c = 6 * ( ((y2 - y1) / h2) - ((y1 - y0)/h1) );

_a1 = h2;
_b1 = 2 * (h2 + h3);

_c1 = 6 * ( ((y3 - y2) / h3) - ((y2 - y1)/h2) );

l3 = (_c1 - (( _a1 * _c ) / _a)) / ( _b1 - (_b / _a) );

l2 = (_c - _b * l3 ) / _a;


b1 = ((y1 - y0)/h1 ) - (h1/6 )* (l2 + 2*l1);
b2 = ((y2 - y1)/h2 ) - (h2/6 )* (l3 + 2*l2);
b3 = ((y3 - y2)/h3 ) - (h3/6 )* (l4 + 2*l3);

c1 = 0;
c2 = l2/2;
c3 = l3 / 2;
c4 = 0;

d1 =  (l2 - l1) / (6 * h1);
d2 = (l3 - l2) / (6 * h2);
d3 = (l4 - l3) / (6 * h3);


%first points 

x0 = round(x0);
x1 = round(x1);
x2 = round(x2);
x3 = round(x3);


for i =  x0 : 1 : x1 + 1
  
    f =   a1  + b1 *  (i - x0) + c1 * (i - x0) * (i - x0) + d1 * (i - x0) * (i - x0) * (i - x0) ;
    
    f = round(f);
    
    if f > 0 && f < Y_MAX
      M(i , f ) = color;
    end
  
end
  
for i =  x1 : 1 : x2 + 1
  
    f =   a2  + b2 *  (i - x1) + c1 * (i - x1) * (i - x1) + d1 * (i - x1) * (i - x1) * (i - x1) ;
    
    f = round(f);
    
    if f > 0 && f < Y_MAX
      M(i , f ) = color;
    end
  
end 
 
 
for i =  x2 : 1 : x3 + 1
  
    f =   a1  + b1 *  (i - x2) + c1 * (i - x2) * (i - x2) + d1 * (i - x2) * (i - x2) * (i - x2) ;
    
    f = round(f);
    
    if f > 0 && f < Y_MAX
      M(i , f ) = color;
    end
  
end



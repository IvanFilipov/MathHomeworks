dx = abs(X1 - X2);
dy = abs(Y1 - Y2);

isReversed = (dx < dy);
    
if(isReversed)
    %simply swapping the vars
    temp = X1;
    X1 = Y1;
    Y1 = temp;
        
    temp = X2;
    X2 = Y2;
    Y2 = temp;
       
    temp = dx;
    dx = dy;
    dy = temp;       
end

incUp = -2*dx + 2*dy;
incDown = 2*dy;
    
if(X1 <= X2)
    incX = 1;
else
    incX = -1;
end

if(Y1 <= Y2)
    incY = 1;
else
    incY = -1;
end

d = -dx + 2*dy;
x = X1;
y = Y1;
steps = dx + 1;

while steps
       
    if(isReversed)
        M(y,x) = color;
    else
        M(x,y) = color;
    end
        
    x = x + incX;
       
    if(d > 0)
        y = y + incY;
        d = d + incUp;
    else
        d = d + incDown;
    end
    
    steps = steps - 1;
end
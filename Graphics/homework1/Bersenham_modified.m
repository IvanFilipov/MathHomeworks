dx = abs(X1 - X2);
dy = abs(Y1 - Y2);

midX = round((X1+X2)/2);
midY = round((Y1+Y2)/2);

M(midX,midY) = 20;
image(M');
set(Ax, 'YDir', 'normal');

dFirstX = abs(X1 - midX);
dFirstY = abs(Y1 - midY);

dSecondX = abs(X2 - midX);
dSecondY = abs(Y2 - midY);

isReversedFirst = (dFirstX < dFirstY);
isReversedSecond = (dSecondX < dSecondY);

if(isReversedFirst)
    %simply swapping the vars
    temp = X1;
    X1 = Y1;
    Y1 = temp;
    
    temp = dFirstX;
    dFirstX = dFirstY;
    dFirstY = temp;       
end

if(isReversedSecond)
    %simply swapping the vars
    temp = X2;
    X2 = Y2;
    Y2 = temp;
          
    temp = dSecondX;
    dSecondX = dSecondY;
    dSecondY = temp;       
end


incFirstUp = -2*dFirstX + 2*dFirstY;
incFirstDown = 2*dFirstY;

incSecondUp = -2*dSecondX + 2*dSecondY;
incSecondDown = 2*dSecondY;


if(X1 <= midX)
    incFirstX = 1;
else
    incFirstX = -1;
end

if(Y1 <= midY)
    incFirstY = 1;
else
    incFirstY = -1;
end

if(X2 <= midX)
    incSecondX = 1;
else
    incSecondX = -1;
end

if(Y2 <= midY)
    incSecondY = 1;
else
    incSecondY = -1;
end

dFirst = -dFirstX + 2*dFirstY;
xFirst = X1;
yFirst = Y1;

dSecond = -dSecondX + 2*dSecondY;
xSecond = X2;
ySecond = Y2;

steps = min(dSecondX,dFirstX) + 1;

while steps
       
    if(isReversedFirst)
        M(yFirst,xFirst) = colorFirst;
    else
        M(xFirst,yFirst) = colorFirst;
    end
        
    if(isReversedSecond)
        M(ySecond,xSecond) = colorSecond;
    else
        M(xSecond,ySecond) = colorSecond;
    end
    
    xFirst = xFirst + incFirstX;
    xSecond = xSecond + incSecondX;
       
    if(dFirst > 0)
        yFirst = yFirst + incFirstY;
        dFirst = dFirst + incFirstUp;
    else
        dFirst = dFirst + incFirstDown;
    end
    
     if(dSecond > 0)
        ySecond = ySecond + incSecondY;
        dSecond = dSecond + incSecondUp;
    else
        dSecond = dSecond + incSecondDown;
    end
    
    steps = steps - 1;
    
    image(M');
    set(Ax, 'YDir', 'normal');
    pause(pauseTime);
end



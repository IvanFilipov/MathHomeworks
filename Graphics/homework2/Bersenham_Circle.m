x = 0;
y = R;
d = 3 - 2*R;

if(yc+R <= MaxY)
    M(xc,yc+R) = 2;
end

if(xc+R <= MaxX)
    M(xc+R,yc) = 2;
end

if(xc-R >= 1)
    M(xc-R,yc) = 2;
end

if(yc - R >= MaxY)
    M(xc,yc- R) = 2;
end

while (42)
   
    if(d > -y)
        y = y -1;
        d = d + 1 - 2*y;
    end
    
    if(d <= x)
        x = x + 1;
        d = d + 1 + 2*x;
    end
    
    if( y == 0)
        break;
    end
    
    if((xc + x <= MaxX) && (yc + y <= MaxY))
        M(xc + x,yc + y) = 2;
    end
    
    if((xc + x <= MaxX) && (yc - y >= 1))
        M(xc + x ,yc - y) = 2;
    end
    
    if((xc - x >= 1) && (yc + y <= MaxY)) 
        M(xc - x ,yc + y) = 2;
    end
    
    if((xc - x >= 1) && (yc - y >= 1))
        M(xc - x,yc - y) = 2;
    end
    
end
    

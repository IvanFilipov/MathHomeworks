x = 0;
y = R;

if(yc+R <= MaxY)
    M(xc,yc+R) = 2;
end

if(xc+R <= MaxX)
    M(xc+R,yc) = 2;
end

if(xc-R >= 1)
    M(xc-R,yc) = 2;
end

while(x < y)
   
    x = x + 1;
    
    y = round(sqrt(R*R-x*x));
    
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
    
    if((xc + y <= MaxX) && (yc + x <= MaxY))
        M(xc + y,yc + x) = 2;
    end
    
    if((xc + y <= MaxX) && (yc - x >= 1))
        M(xc + y ,yc - x) = 2;
    end
    
    if((xc - y >= 1) && (yc + x >= MaxY))
        M(xc - y ,yc + x) = 2;
    end
    
    if((xc - y >= 1) && (yc - x >= 1))
        M(xc - y,yc - x) = 2;
    end
    
end


if(x == y)
   
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

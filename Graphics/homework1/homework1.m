MaxX = 20;
MaxY = 15;

pauseTime = 2;

M = zeros(MaxX,MaxY);
Ax = axes;
image(M');
set(Ax, 'YDir', 'normal');

color = 30;
colorFirst = 50;
colorSecond = 50;

while(42)
    
    try
        [X,Y] = ginput(2);
    catch
        clear;
        clc;
        break;
    end
    
    
    X1 = round(X(1));
    Y1 = round(Y(1));

    X2 = round(X(2));
    Y2 = round(Y(2));

    M(X1,Y1) = color;
    M(X2,Y2) = color;
    
    image(M');
    set(Ax, 'YDir', 'normal');

    Bersenham_Line;
    pause(1);
    
    image(M');
    set(Ax, 'YDir', 'normal');
    
    pause(2);
    
    X1 = round(X(1));
    Y1 = round(Y(1));

    X2 = round(X(2));
    Y2 = round(Y(2));
    
    Bersenham_modified;
    hold on
    
end
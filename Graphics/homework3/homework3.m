MaxX = 50;%100;
MaxY = 35;%70;
M = zeros(MaxX,MaxY);

colCircles = [1,0,0];
colFill = [0,0,1];

borderValue = 1;
fillValue = 2;


Ax = axes('Position',[0.1,0.1,0.8,0.8],'XLim',[0,MaxX],'YLim',[0,MaxY]);


numCircles = 1;

while(numCircles)
    
    try
        [X,Y] = ginput(2);
    catch
        clear;
        clc;
        break;
    end
    
    
    xc = round(X(1));
    yc = round(Y(1));

    Rx = round(X(2));
    Ry = round(Y(2));

    R = round(sqrt((Rx - xc)*(Rx-xc) + (Ry - yc)*(Ry-yc)));

    Bersenham_Circle;

    for i = 1 : MaxX
        for j = 1 : MaxY
            if M(i,j) == borderValue
                rectangle('Position',[i-1,j-1,1,1],'FaceColor',colCircles);
            end
        end
    end    
    
    hold on;
    
    numCircles = numCircles - 1;
    
end

[x,y] = ginput(1); %fill starting point

x = round(x);
y = round(y);

Fill_Area;











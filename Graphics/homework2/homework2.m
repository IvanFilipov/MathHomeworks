MaxX = 100;%100;
MaxY = 70;%70;
M = zeros(MaxX,MaxY);

Col = [1,1,1;1,0,0];
c= 2;
color = Col(c,:);

Ax = axes('Position',[0.1,0.1,0.8,0.8],'XLim',[0,MaxX],'YLim',[0,MaxY]);


while(42)
    
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

    for i = 1:MaxX
        for j = 1 : MaxY
            if M(i,j) == c
                rectangle('Curvature',[1,1],'Position',[i-1,j-1,1,1],'FaceColor',color);
            end
        end
    end    

    pause(2);
    M = zeros(MaxX,MaxY);
    Col = [1,1,0;1,1,0];
    c = 2;
    color = Col(c,:);

    SimpleCircle;

    for i = 1:MaxX
        for j = 1 : MaxY
            if M(i,j) == c
                rectangle('Curvature',[1,1],'Position',[i-1,j-1,1,1],'FaceColor',color);
            end
        end
    end
    
    hold on;
end
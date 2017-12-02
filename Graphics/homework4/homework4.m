X_MAX = 100;
Y_MAX = 70;

Ax = axes('Position',[0.1,0.1,0.8,0.8],'XLim',[0,X_MAX],'YLim',[0,Y_MAX]);


%rectangle read and draw
 
try
  [X,Y] = ginput(2);
catch
  clear;
  clc;
end
    
    
rectX1 = round(X(1));
rectY1 = round(Y(1));

rectX2 = round(X(2));
rectY2 = round(Y(2));
  
Xmin = min(rectX1,rectX2);
Xmax = max(rectX1,rectX2);

Ymin = min(rectY1,rectY2);
Ymax = max(rectY1,rectY2);

height = Ymax - Ymin;
width = Xmax - Xmin;
  
rectColor = [1,0,0];
 
rectangle('Position',[Xmin,Ymin,width,height],'FaceColor',rectColor);
  
hold on;

%line read
try
  [X,Y] = ginput(2);
catch
  clear;
  clc;
end
    
    
X1 = round(X(1));
Y1 = round(Y(1));

X2 = round(X(2));
Y2 = round(Y(2));

M = zeros(X_MAX,Y_MAX);

color = 1;
colLine = [0,1,0];

Bersenham_Line;

for i = 1 : X_MAX
   for j = 1 : Y_MAX
      if M(i,j) == color
         rectangle('Position',[i-1,j-1,1,1],'FaceColor',colLine);
     end
  end
end  
  
%where the line is  
x1 = X(1);
x2 = X(2);
y1 = Y(1);
y2 = Y(2);

%after this X1,Y1,X2,Y2 will be the new point 
Lian_Barsky2DClip;


%new line draw
color = 2;
colLine = [0,0,1];

X1 = round(X1);
X2 = round(X2);
Y1 = round(Y1);
Y2 = round(Y2);

Bersenham_Line;

pause(2);

for i = 1 : X_MAX
   for j = 1 : Y_MAX
      if M(i,j) == color
         rectangle('Position',[i-1,j-1,1,1],'FaceColor',colLine);
     end
  end
end  

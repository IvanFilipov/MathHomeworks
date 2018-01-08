X_MAX = 100;
Y_MAX = 200;

Ax = axes('Position',[0.1,0.1,0.8,0.8],'XLim',[0,X_MAX],'YLim',[0,Y_MAX]);

%M = zeros(X_MAX,Y_MAX);

NPOINTS = 5;

try
  [X,Y] = ginput(NPOINTS);
catch
  clear;
  clc;
end

%x0 = round(X(1));
%y0 = round(Y(1));
%
%x1 = round(X(2));
%y1 = round(Y(2));
%
%x2 = round(X(3));
%y2 = round(Y(3));
%
%x3 = round(X(4));
%y3 = round(Y(4));


%x0 = 3.0; 
%x1 = 4.5;
%x2 = 7.0;
%x3 = 9.0;


%y0 = 2.5;
%y1 = 1.0;
%y2 = 2.5;
%y3 = 0.5; 


color = 1;
colLine = [1,0,0];

%_spline;
%
%for i = 1 : X_MAX
%   for j = 1 : Y_MAX
%      if M(i,j) == color
%         rectangle('Position',[i-1,j-1,1,1],'FaceColor',colLine);
%     end
%  end
%end



xf = [X(1):1:X(NPOINTS)];

#spl = interp1 (X, Y,xf ,"spline");
spl = spline (X, Y, xf);

hold on;
plot(spl,"b");




%iteractive movement

i = input("which x to move ");

[newX,newY] = ginput(1);

X(i) = newX;
Y(i) = newY;


%switch(xi)
%
%    case 1 
%    x0 = round(newX(1));
%    y0 = round(newY(1));
%    
%    case 2 
%    x1 = round(newX(1));
%    y1 = round(newY(1));
%    
%    case 3 
%    x2 = round(newX(1));
%    y2 = round(newY(1));
%    
%    case 4 
%    x3 = round(newX(1));
%    y3 = round(newY(1));
%    
%    otherwise 
%        printf("wrong input!!!");
%        return
%        
%endswitch   
  
  
colLine = [0,0,1];
color = 2;
 
%spline;    
%  
%for i = 1 : X_MAX
%   for j = 1 : Y_MAX
%      if M(i,j) == color
%         rectangle('Position',[i-1,j-1,1,1],'FaceColor',colLine);
%     end
%  end
%end

xf = [X(1):1:X(NPOINTS)];

# spl = interp1 (X, Y,xf ,"spline");
spl = spline (X, Y,xf);

hold on;
plot(spl,"b");



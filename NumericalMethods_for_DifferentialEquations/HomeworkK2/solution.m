tspan = [0,50]; %begin - end
h = 2 ^ (-9);   

F = '[y(2);2*y(2)- 3*(y(2)^3)-2*y(1)]' ;

y0 = [1;-2];

[tout , yout] = rk4(F, tspan, y0, h);

plot(tout, yout);

%for the table 

%t = tout(end - 10 : end);
%y = yout(end -10: end , 1); %first row in yout
%yPrim = yout(end -10: end , 2); %second  

%matr = [t, y, yPrim];

%phase curve

%x1 = yout(: ,1); 
%y1 = yout(: ,2);

%figure(2);
%plot(x1,y1);

%ред на сходимост
%yH = (yout(1:10,1))';

%[tout2, yout2] = rk4(F, tspan, y0, h/2);
%[tout3, yout4] = rk4(F, tspan, y0, h/4);

%yH2 = (yout2(1:2:20,1))';
%yH4 = (yout4(1:4:40,1))';

%alpha =  log( abs ( (yH - yH2) ./ (yH2- yH4) ))/log(2);
                         

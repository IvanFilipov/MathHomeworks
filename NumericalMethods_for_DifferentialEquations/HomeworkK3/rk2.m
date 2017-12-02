function [ tout, yout ] = rk2( F,tspan,y0,h )

t0=tspan(1);
tfinal=tspan(2);
t=t0;
y=y0;
tout=t;
yout=y';
while t<tfinal
    s1=feval(F,t,y);
    s2=feval(F,t+0.5*h,y+0.5*h*s1);
    y=y+h*s2;
    t=t+h;
    tout(end+1,1)=t;
    yout(end+1,:)=y';
end


end
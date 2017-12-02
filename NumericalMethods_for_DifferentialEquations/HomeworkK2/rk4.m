function [ tout, yout ] = rk4( F,tspan,y0,h )

    F=inline(F,'t','y');    
    t0=tspan(1);
    tfinal=tspan(2);
    t=t0;
    y=y0;
    tout=t;
    yout=y';
    
    while t<tfinal
    
        s1 = feval(F,t,y);
        s2 = feval(F,t+0.5*h,y+0.5*h*s1);
        s3 = feval(F,t+0.5*h,y+0.5*h*s2);
        s4 = feval (F,t+h,y+h*s3);
    
        y = y + (1/6)* h *(s1 + 2*s2 + 2*s3 + s4);
        t=t+h;
    
        tout(end+1,1)=t;
        yout(end+1,:)=y';
    end
end

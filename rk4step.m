function y=rk4step(t,w,h,substep,ydot)
%w is a matrix of [v1 ... vn w1 ... wn]
%one step of the Runge-Kutta order 4 method
subh=h/substep;
for i=1:substep
    s1=ydot(t,w);
    s2=ydot(t+subh/2,w+subh*s1/2);
    s3=ydot(t+subh/2,w+subh*s2/2);
    s4=ydot(t+subh,w+subh*s3);
    y=w+subh.*(s1+2*s2+2*s3+s4)./6;
    w=y;
end

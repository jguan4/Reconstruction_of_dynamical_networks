function df=drk4(t,w,func)
dx=1e-4;
X=size(w,2);
%w as the current x values, structure: 1 x nodes*2
%d, A, P and nodes are parameters
%t as needed for rk4(no actural use)
%h as step size
%j as the ranking of variable to vary
%start the minus h and plus h vectors as current x values
mh=repmat(w,X,1);
ph=mh;
%minus or plus h at the given variable location j
mh=mh-(dx*eye(X));
ph=ph+(dx*eye(X));
%calculate f minus h and f plus h
fmh=func(t,mh);
fph=func(t,ph);
%get df
df=(fph-fmh)./(2*dx);

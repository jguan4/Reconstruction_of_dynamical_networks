function df = dfunc(A,t,y) 
varNum = size(A,1);
[P, cf]=createParametersHenon(varNum);
df = DHenon_whole(A,P,cf,t,y);
function df=DHenon_whole(A,P,cf,t,x)
varNum=size(A,1);
df=[-diag(P(1,:).*sin(x(1:varNum)))+cf*A diag(P(2,:));eye(varNum) zeros(varNum)]';
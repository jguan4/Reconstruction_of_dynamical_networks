function W=CreateW_diagR(varNum,p,Rs,Qs)
Wdiag=eye(varNum+p);
factor=sqrt(diag(Rs)./diag(Qs));
Wdiag(1:varNum,1:varNum)=diag(factor).*Wdiag(1:varNum,1:varNum);
W=Wdiag;
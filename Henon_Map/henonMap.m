function y=henonMap(A,P,cf,t,x)
varNum=size(A,1);
y=[P(1,:).*cos(x(1,1:varNum))+P(2,:).*x(1,varNum+1:varNum*2)+...
    (cf*A*x(1,1:varNum)')' x(1,1:varNum)];
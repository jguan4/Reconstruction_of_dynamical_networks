function [d,P]=createParametersFN(varNum)
%%constants
d=0.01;
a=0.42;
b=0.8;
c=0.08;
delta=1;
I=-0.025;%.4;%0.3;%0.4;
P=zeros(varNum,5);
for n=1:varNum
    P(n,1)=a*(1+(rand*2-1)*0.05);
    P(n,2)=b*(1+(rand*2-1)*0.05);
    P(n,3)=c*(1+(rand*2-1)*0.05);
    P(n,4)=delta*(1+(rand*2-1)*0.05);
    P(n,5)=I*(1+(rand*2-1)*0.1);
end
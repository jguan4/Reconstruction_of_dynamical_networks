function r=GeneralCreateC(times,H,W,y,network,func)
X=size(network,2);
T=length(times);
p=size(H,1);
r=zeros((X+p)*T,1);%build c
for i=1:T
    x=squeeze(network(i,:));
    if i==1
        r((X+p)*(i-1)+X+1:(X+p)*i,1)=y(i,:)'-H*x';
    else
        r((X+p)*(i-1)+X+1:(X+p)*i,1)=y(i,:)'-H*x';
        xm1=squeeze(network(i-1,:));
        r((X+p)*(i-1)+1:(X+p)*(i-1)+X,1)=(x-func(times(i),xm1))';
    end
    r((X+p)*(i-1)+1:(X+p)*i,1)=W*r((X+p)*(i-1)+1:(X+p)*i,1);
end


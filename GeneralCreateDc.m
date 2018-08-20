function A=GeneralCreateDc(times,H,W,network,dfunc)
X=size(network,2);
T=length(times);
p=size(H,1);
A=zeros((X+p)*T,X*2);%build dc
for i=1:T
    if i==1
        temp2=zeros(X+p,X);%build for dcdx block
        temp2(X+1:end,:)=-H;
        A((i-1)*(X+p)+1:(i)*(X+p),1:X)=temp2;
        x=squeeze(network(i,:));
        temp1=zeros(X+p,X);%build for dcdxm1 block
        temp1(1:X,1:X)=-dfunc(times(i),x)';
        A((i-1)*(X+p)+1:(i)*(X+p),1+X:2*X)=temp1;
    elseif i==T
        temp2=zeros(X+p,X);%build for dcdx block
        temp2(1:X,:)=eye(X);
        temp2(X+1:end,:)=-H;
        A((i-1)*(X+p)+1:(i)*(X+p),1:X)=temp2;
    else
        temp2=zeros(X+p,X);%build for dcdx block
        temp2(1:X,:)=eye(X);
        temp2(X+1:end,:)=-H;
        A((i-1)*(X+p)+1:(i)*(X+p),1:X)=temp2;
        x=squeeze(network(i,:));
        temp1=zeros(X+p,X);%build for dcdxm1 block
        temp1(1:X,1:X)=-dfunc(times(i),x)';
        A((i-1)*(X+p)+1:(i)*(X+p),1+X:2*X)=temp1;
    end
    A((i-1)*(X+p)+1:(i)*(X+p),:)=W*A((i-1)*(X+p)+1:(i)*(X+p),:);
end


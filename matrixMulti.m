%a of size m*p by 2*n and b of size m*p by 1
function result=matrixMulti(a,b,m,n)
p=size(a,1)/m;
result=zeros(n*p,1);
for i=1:p
    if i==p
        result((p-1)*n+1:end,1)=a((p-1)*m+1:end,1:n)'*b((p-1)*m+1:end,1);
    else
        result((i-1)*n+1:i*n,1)=a((i-1)*m+1:i*m,1:n)'*b((i-1)*m+1:i*m,1)...
            +a((i-1)*m+1:i*m,n+1:2*n)'*b(i*m+1:(i+1)*m,1);
    end
end
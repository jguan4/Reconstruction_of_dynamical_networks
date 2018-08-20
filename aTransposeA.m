%A is of size m*x by 2*n
function ata=aTransposeA(A,m,n)
x=size(A,1)/m;
ata=zeros(n*x,2*n);
for i=1:x
    ata((i-1)*n+1:i*n,1:n)=A((i-1)*m+1:i*m,1:n)'*A((i-1)*m+1:i*m,1:n)+...
        A((i-1)*m+1:i*m,1+n:n*2)'*A((i-1)*m+1:i*m,1+n:n*2);
    if i~=x
        ata((i-1)*n+1:i*n,1+n:n*2)=A(i*m+1:(i+1)*m,1:n)'*A((i-1)*m+1:i*m,1+n:n*2);
    end
end
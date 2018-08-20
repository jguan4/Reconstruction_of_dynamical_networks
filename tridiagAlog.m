%ata is of size n*p 2*n, d is of size n*p by n
function X=tridiagAlog(ata,ds,n)
p=size(ata,1)/n;
alpha=zeros(p*n,n);
beta=zeros(p*n,size(ds,2));
alpha(1:n,:)=ata(1:n,1:n)\(ata(1:n,n+1:2*n)');
beta(1:n,:)=ata(1:n,1:n)\ds(1:n,:);
for i=2:p
    ai=ata((i-2)*n+1:(i-1)*n,1+n:2*n);
    bi=ata((i-1)*n+1:i*n,1:n);
    ci=ata((i-1)*n+1:i*n,1+n:2*n)';
    di=ds((i-1)*n+1:i*n,:);
    if i~=p
        %(b_i-a_i*alpha_i-1)\c_i
        alpha((i-1)*n+1:i*n,:)=(bi-ai*alpha((i-2)*n+1:(i-1)*n,:))\ci;
%         rank(bi-ai*alpha((i-2)*n+1:(i-1)*n,:))
    end
    %(b_i-a_i*alpha_i-1)\(d_i-a_i*beta_i-1)
    beta((i-1)*n+1:i*n,:)=(bi-ai*alpha((i-2)*n+1:(i-1)*n,:))...
            \(di-ai*beta((i-2)*n+1:(i-1)*n,:));
end
X=zeros(p*n,size(ds,2));
X((p-1)*n+1:end,:)=beta((p-1)*n+1:end,:);
for j=p-1:-1:1
    %beta_i-alpha_i*x_i+1
    X((j-1)*n+1:j*n,:)=beta((j-1)*n+1:j*n,:)-alpha((j-1)*n+1:j*n,:)...
        *X(j*n+1:(j+1)*n,:);
end
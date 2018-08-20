function nmat=nthconnect(Adj,n)
nmat=zeros(size(Adj));
for i=1:n
    nmat=nmat+Adj^i;
end
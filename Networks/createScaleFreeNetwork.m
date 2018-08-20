function Adj=createScaleFreeNetwork(numNode,m0)
Adj=zeros(numNode,numNode);
nthconnectAdj=nthconnect(Adj,numNode-1);
los=size(find(~nthconnectAdj),1);
while (los>0)
    Adj=zeros(numNode,numNode);
    for i=2:m0
        Adj=connectij(Adj,1,i);
    end
    for j=m0+1:numNode
        psubi=sum(Adj(1:j-1,:),2)/sum(sum(Adj(1:j-1,:)));
        ppart=cumsum(psubi);
        count=0;
        while (count<m0)
            m=find(ppart>rand,1);
            if (Adj(m,j)~=1)
                Adj=connectij(Adj,m,j);
                count=count+1;
            end
        end
    end
    nthconnectAdj=nthconnect(Adj,numNode-1);
    los=size(find(~nthconnectAdj),1);
end
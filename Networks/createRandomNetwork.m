function Adj=createRandomNetwork(numNode,connectionPercent)
Adj=zeros(numNode,numNode);
nodes=1:numNode;
connections=nchoosek(nodes,2);
numConn=size(connections,1);
numC=floor(numConn*connectionPercent);
nthconnectAdj=nthconnect(Adj,numNode-1);
los=size(find(~nthconnectAdj),1);
while (los>0)
    Adj=zeros(numNode,numNode);
    p = sort(randperm(numConn,numC));
    cs=connections(p,:);
    for i=1:numC
        Adj=connectij(Adj,cs(i,1),cs(i,2));
    end
    nthconnectAdj=nthconnect(Adj,numNode-1);
    los=size(find(~nthconnectAdj),1);
end

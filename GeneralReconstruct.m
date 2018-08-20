function [k,network,networkError]=GeneralReconstruct(steps,times,H,W,init,correctValue,y,func,dfunc)
format long

p=size(y,2);%number of observed varNum
X=size(init,2);
T=length(times);

network=init;%initialize network

normrpre=Inf;
normrchangelimit=1e-11;

for k=2:steps
    k
    A=GeneralCreateDc(times,H,W,network,dfunc);
    r=GeneralCreateC(times,H,W,y,network,func);
    ata=aTransposeA(A,X+p,X);
    ata=ata(any(ata,2),:);
    ata(:,1:X)=ata(:,1:X);
    a=-matrixMulti(A,r,X+p,X);
    v=tridiagAlog(ata,a,X);
    v=reshape(v,[X,T])';
    normr=norm(r);
    normrchange=abs((normr-normrpre)/normr)
    if normrchange<normrchangelimit
        break
    end
    network=network+v;
    normrpre=normr;
end
networkError=abs(network-correctValue);
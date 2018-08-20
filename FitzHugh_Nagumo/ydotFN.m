function z=ydotFN(A,d,P,varNum,t,y)
%Model functions. z(1)=v' and z(2)=w'.
%Setting negative values to 0
dimNum=2;
N=size(y,1);
previousV=y(:,1:varNum);
previousw=y(:,varNum+1:dimNum*varNum);
z(:,1:varNum)=-previousw+previousV.*repmat(P(:,4)',N,1)-(previousV.^3)./3+...
    repmat(P(:,5)',N,1)+(d*A*previousV')';
z(:,varNum+1:dimNum*varNum)=repmat(P(1:end,3)',N,1).*(previousV+...
    repmat(P(:,1)',N,1)-previousw.*repmat(P(:,2)',N,1));
clear

addpath(genpath('./'))
[A, varNum, dimNum, dynamic, dfuncDefined] = promptInput;
ydot = @(t,y) ydot(A,t,y,dynamic);


%% Initial constants setup
% Set length of the trajectory here
times=3000;
ttime=1000;

% Set number of realizations to run
numRealizations = 50;

% Set substep interval here
substep=10;      %Define step size
substeph=0.001;
h=substep*substeph;
func=@(t,x) rk4step(t,x,h,substep,ydot);
if dfuncDefined
    dfunc = @(t,y) dfunc(A,t,y);
else
    dfunc = @(t,w) drk4(t,w,func);
end

% Set measured nodes here
measureds=1:varNum;

% Build correct trajectory
initn=rand([1 varNum*dimNum]);
[t,correctValue]=BuildNetwork_Demo(varNum*dimNum,initn,times,h,func);
correctValue=correctValue(ttime:end,:);
t=t(ttime:end);

% Set noise level
ms=max(correctValue);
R=1e-10;
Q=1e-4*R;
Rs=R.*ms;
Rs=diag(Rs);
Qs=diag(Q.*ms);
initmultiC=sqrt(R); %set initial noise level here

%% Run to get condition number with given measureds
for m=1:size(measureds,1)
    measured=measureds(m,:);
    measured=sort(measured);
    condNum_struct=struct('Rs',{},'Qs',{},'condNums',{},'correctValue',{});
    condNums=zeros(numRealizations,varNum*dimNum);
    for realization=1:numRealizations
        rng(realization);

        initmulti=initmultiC.*ms;
        init=correctValue+repmat(initmulti,size(correctValue,1),1).*randn(size(correctValue));
        
        condNum=computeConditionNumber_diagR(varNum*dimNum,correctValue,Rs,...
            Qs,t,measured,func,init,dfunc);
        condNums(realization,:)=condNum;
    end
    avecondNum=sqrt(mean(condNums.^2));
    stdcondNum=std(condNums,0,1);
    
    condNum_struct(1).Rs=Rs;
    condNum_struct(1).Qs=Qs;
    condNum_struct(1).condNums=condNums;
    condNum_struct(1).correctValue=correctValue;
    save(strcat(path,'/condNum',num2str(ttime),'_',num2str(R),'_',num2str(Q),...
        '_',num2str(measured),'_',num2str(initmultiC),'.mat'),'condNum_struct')
end

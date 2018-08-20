% This function computes the condition number of each variable in a network
% Required inputs:  varNum - total number of variables
%                   correctValue - correct trajectory
%                   R - observational noise level
%                   Q - system noise level
%                   times - time trajectory
%                   measured - observed variables
%                   func(t,x) - function to compute the dynamics
% Optional inputs:  init - initial guess for GN
%                   (default init: correctValue)
%                   dfunc(t,x) - function to compute the Jacobian matrix
%                   (default dfunc: compute Jacobian matrix by center
%                   difference method)
%                   GNlimit - limit for Gauss-Newton steps 
%                   (default GNlimit: 50)
                   
function [condNum]=computeConditionNumber_diagR(varNum,correctValue,Rs,Qs,times,measured,func,init,dfunc,GNlimit)
switch nargin
    case 8
        dfunc=@(t,w) drk4(t,w,func);
        GNlimit=50;
    case 9
        if isempty(init)
            init=correctValue;
        end
        GNlimit=50;
    case 10
        if isempty(dfunc)
            dfunc=@(t,w) drk4(t,w,func);
        elseif isempty(init)
            init=correctValue;
        end
    otherwise
        init=correctValue;
        dfunc=@(t,w) drk4(t,w,func);
        GNlimit=50;
end

H=GeneralH(varNum,measured);
W=CreateW_diagR(varNum,size(H,1),Rs,Qs);

y=(H*correctValue')';
y=y+repmat((sqrt(H*diag(Rs)))',size(y,1),1).*randn(size(y));

try
    [k,network,networkError]=GeneralReconstruct(GNlimit,times,H,W,init,correctValue,y,func,dfunc);
catch
    warning('No Fix Method didnt converge')
    networkError=Inf;
end
meanErrorsNF=sqrt(sum(networkError.^2));
condNum=meanErrorsNF./(diag(sqrt(Rs))');



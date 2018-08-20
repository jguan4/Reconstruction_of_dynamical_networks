function [P,cf]=createParametersHenon(varNum)
%%constants
P = zeros(2,varNum);
P(1,:) = 2+0.1*rand(1,varNum);
P(2,:) = 0.4+0.1*rand(1,varNum);
cf = 1/varNum;
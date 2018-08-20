%This function models the behavior of a neuron network. It takes in A 
%(adjacency matrix), initial points, steps and interval it is stepping
%through, and a parameter matrix P.
%P = [a1 b1 c1 delta1 I1; ...;an bn cn deltan In]
%Assume init=(initial v, initial w), interval=(initial point, end point).
% Use callNeuronNetwork to call this function


function [t,y]=BuildNetwork_Demo(varNum,init,steps,h,func)
format long
%allocate y and t
y=zeros(steps,varNum);
t=zeros(1,steps);
%initiate
init=init(:)';
y(1,:)=init;
t(1)=0;
for k=1:steps-1
    t(k+1)=t(k)+h;
    y(k+1,:)=func(t,y(k,:));
end
% figure
% plot(t,y(:,:))
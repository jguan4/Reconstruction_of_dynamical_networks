% Ks - [V0_Per1(1), V1_Per1(2), V0_Per2(3), V1_Per2(4), V0_Cry1(5), 
%       V1_Cry1(6), V2_Cry1(7), V0_Cry2(8), V1_Cry2(9), V2_Cry2(10), 
%       V1_Rev_erbalpha(11), V0_Clk(12), V1_Clk(13), V0_Bmal1(14), 
%       V1_Bmal1(15), V0_Rorc(16), V1_Rorc(17), V2_Rorc(18), na1_Per1(19),
%       ni1_Per1(20), ni2_Per1(21), ni3_Per1(22), ni4_Per1(23), na1_Per2(24), 
%       ni1_Per2(25), ni2_Per2(26), ni3_Per2(27), ni4_Per2(28), na1_Cry1(29), 
%       na2_Cry1(30), ni1_Cry1(31), ni2_Cry1(32), ni3_Cry1(33), ni4_Cry1(34), 
%       ni5_Cry1(35), na1_Cry2(36), na2_Cry2(37), ni1_Cry2(38), ni2_Cry2(39), 
%       ni3_Cry2(40), ni4_Cry2(41), ni5_Cry2(42), na1_Rev_erbalpha(43), 
%       ni1_Rev_erbalpha(44), ni2_Rev_erbalpha(45), ni3_Rev_erbalpha(46), 
%       ni4_Rev_erbalpha(47), na1_Clk(48), ni1_Clk(49), na1_Bmal1(50), 
%       ni1_Bmal1(51), na1_Rorc(52), na2_Rorc(53), ni1_Rorc(54), ni2_Rorc(55), 
%       ni3_Rorc(56), ni4_Rorc(57), ni5_Rorc(58), KA1_Per1(59), KI1_Per1(60), 
%       KI2_Per1(61), KI3_Per1(62), KI4_Per1(63), KA1_Per2(64), KI1_Per2(65), 
%       KI2_Per2(66), KI3_Per2(67), KI4_Per2(68), KA1_Cry1(69), KA2_Cry1(70), 
%       KI1_Cry1(71), KI2_Cry1(72), KI3_Cry1(73), KI4_Cry1(74), KI5_Cry1(75), 
%       KA1_Cry2(76), KA2_Cry2(77), KI1_Cry2(78), KI2_Cry2(79), KI3_Cry2(80), 
%       KI4_Cry2(81), KI5_Cry2(82), KA1_Rev_erbalpha(83), KI1_Rev_erbalpha(84), 
%       KI2_Rev_erbalpha(85), KI3_Rev_erbalpha(86), KI4_Rev_erbalpha(87), 
%       KA1_Clk(88), KI1_Clk(89), KA1_Bmal1(90), KI1_Bmal1(91), KA1_Rorc(92), 
%       KA2_Rorc(93), KI1_Rorc(94), KI2_Rorc(95), KI3_Rorc(96), KI4_Rorc(97), 
%       KI5_Rorc(98), km_Per1(99), km_Per2(100), km_Cry1(101), km_Cry2(102), 
%       km_Rev_erbalpha(103), km_Clk(104), km_Bmal1(105), km_Rorc(106), kp_PER1(107), 
%       kp_PER2(108), kp_CRY1(109), kp_CRY2(110), kp_REV_ERBalpha(111), kp_CLK(112), 
%       kp_BMAL1(113), kp_RORc(114), tPer1(115), tPer2(116), tCry1(117), tCry2(118), 
%       tRev_erbalpha(119), tClk(120), tBmal1(121), tRorc(122), aPER1_CRY1(123),
%       aPER1_CRY2(124), aPER2_CRY1(125), aPER2_CRY2(126), aCLK_BMAL1(127), 
%       dPER1_CRY1(128), dPER1_CRY2(129), dPER2_CRY1(130), dPER2_CRY2(131), 
%       dCLK_BMAL1(132)];
% y -   [Per1(1), Per2(2), Cry1(3), Cry2(4), Rev_erbalpha(5), Clk(6), Bmal1(7), 
%        Rorc(8), PER1(9), PER2(10), CRY1(11), CRY2(12), REV_ERBalpha(13), CLK(14), 
%        BMAL1(15), RORc(16), PER1_CRY1(17), PER2_CRY1(18), PER1_CRY2(19),
%        PER2_CRY2(20), CLK_BMAL1(21)]
function z=ydotMammalian(Ks,varNum,t,y)
N=size(y,1);
z=zeros(N,21*varNum);

% Previous trajectories
Per1=y(:,1:varNum);
Per2=y(:,varNum+1:2*varNum);
Cry1=y(:,2*varNum+1:3*varNum);
Cry2=y(:,3*varNum+1:4*varNum);
Rev_erbalpha=y(:,4*varNum+1:5*varNum);
Clk=y(:,5*varNum+1:6*varNum);
Bmal1=y(:,6*varNum+1:7*varNum);
Rorc=y(:,7*varNum+1:8*varNum);
PER1=y(:,8*varNum+1:9*varNum);
PER2=y(:,9*varNum+1:10*varNum);
CRY1=y(:,10*varNum+1:11*varNum);
CRY2=y(:,11*varNum+1:12*varNum);
REV_ERBalpha=y(:,12*varNum+1:13*varNum);
CLK=y(:,13*varNum+1:14*varNum);
BMAL1=y(:,14*varNum+1:15*varNum);
RORc=y(:,15*varNum+1:16*varNum);
PER1_CRY1=y(:,16*varNum+1:17*varNum);
PER2_CRY1=y(:,17*varNum+1:18*varNum);
PER1_CRY2=y(:,18*varNum+1:19*varNum);
PER2_CRY2=y(:,19*varNum+1:20*varNum);
CLK_BMAL1=y(:,20*varNum+1:21*varNum);

% Constants
V0_Per1=repmat(Ks(:,1)',N,1); 
V1_Per1=repmat(Ks(:,2)',N,1); 
V0_Per2=repmat(Ks(:,3)',N,1); 
V1_Per2=repmat(Ks(:,4)',N,1); 
V0_Cry1=repmat(Ks(:,5)',N,1); 
V1_Cry1=repmat(Ks(:,6)',N,1); 
V2_Cry1=repmat(Ks(:,7)',N,1); 
V0_Cry2=repmat(Ks(:,8)',N,1); 
V1_Cry2=repmat(Ks(:,9)',N,1); 
V2_Cry2=repmat(Ks(:,10)',N,1); 
V1_Rev_erbalpha=repmat(Ks(:,11)',N,1); 
V0_Clk=repmat(Ks(:,12)',N,1); 
V1_Clk=repmat(Ks(:,13)',N,1); 
V0_Bmal1=repmat(Ks(:,14)',N,1); 
V1_Bmal1=repmat(Ks(:,15)',N,1); 
V0_Rorc=repmat(Ks(:,16)',N,1); 
V1_Rorc=repmat(Ks(:,17)',N,1); 
V2_Rorc=repmat(Ks(:,18)',N,1); 
na1_Per1=repmat(Ks(:,19)',N,1); 
ni1_Per1=repmat(Ks(:,20)',N,1); 
ni2_Per1=repmat(Ks(:,21)',N,1); 
ni3_Per1=repmat(Ks(:,22)',N,1); 
ni4_Per1=repmat(Ks(:,23)',N,1); 
na1_Per2=repmat(Ks(:,24)',N,1); 
ni1_Per2=repmat(Ks(:,25)',N,1); 
ni2_Per2=repmat(Ks(:,26)',N,1); 
ni3_Per2=repmat(Ks(:,27)',N,1); 
ni4_Per2=repmat(Ks(:,28)',N,1); 
na1_Cry1=repmat(Ks(:,29)',N,1); 
na2_Cry1=repmat(Ks(:,30)',N,1); 
ni1_Cry1=repmat(Ks(:,31)',N,1); 
ni2_Cry1=repmat(Ks(:,32)',N,1); 
ni3_Cry1=repmat(Ks(:,33)',N,1); 
ni4_Cry1=repmat(Ks(:,34)',N,1); 
ni5_Cry1=repmat(Ks(:,35)',N,1); 
na1_Cry2=repmat(Ks(:,36)',N,1); 
na2_Cry2=repmat(Ks(:,37)',N,1); 
ni1_Cry2=repmat(Ks(:,38)',N,1); 
ni2_Cry2=repmat(Ks(:,39)',N,1); 
ni3_Cry2=repmat(Ks(:,40)',N,1); 
ni4_Cry2=repmat(Ks(:,41)',N,1); 
ni5_Cry2=repmat(Ks(:,42)',N,1); 
na1_Rev_erbalpha=repmat(Ks(:,43)',N,1); 
ni1_Rev_erbalpha=repmat(Ks(:,44)',N,1); 
ni2_Rev_erbalpha=repmat(Ks(:,45)',N,1); 
ni3_Rev_erbalpha=repmat(Ks(:,46)',N,1); 
ni4_Rev_erbalpha=repmat(Ks(:,47)',N,1); 
na1_Clk=repmat(Ks(:,48)',N,1); 
ni1_Clk=repmat(Ks(:,49)',N,1); 
na1_Bmal1=repmat(Ks(:,50)',N,1); 
ni1_Bmal1=repmat(Ks(:,51)',N,1); 
na1_Rorc=repmat(Ks(:,52)',N,1); 
na2_Rorc=repmat(Ks(:,53)',N,1); 
ni1_Rorc=repmat(Ks(:,54)',N,1); 
ni2_Rorc=repmat(Ks(:,55)',N,1); 
ni3_Rorc=repmat(Ks(:,56)',N,1); 
ni4_Rorc=repmat(Ks(:,57)',N,1); 
ni5_Rorc=repmat(Ks(:,58)',N,1); 
KA1_Per1=repmat(Ks(:,59)',N,1); 
KI1_Per1=repmat(Ks(:,60)',N,1); 
KI2_Per1=repmat(Ks(:,61)',N,1); 
KI3_Per1=repmat(Ks(:,62)',N,1); 
KI4_Per1=repmat(Ks(:,63)',N,1); 
KA1_Per2=repmat(Ks(:,64)',N,1); 
KI1_Per2=repmat(Ks(:,65)',N,1); 
KI2_Per2=repmat(Ks(:,66)',N,1); 
KI3_Per2=repmat(Ks(:,67)',N,1); 
KI4_Per2=repmat(Ks(:,68)',N,1); 
KA1_Cry1=repmat(Ks(:,69)',N,1); 
KA2_Cry1=repmat(Ks(:,70)',N,1); 
KI1_Cry1=repmat(Ks(:,71)',N,1); 
KI2_Cry1=repmat(Ks(:,72)',N,1); 
KI3_Cry1=repmat(Ks(:,73)',N,1); 
KI4_Cry1=repmat(Ks(:,74)',N,1); 
KI5_Cry1=repmat(Ks(:,75)',N,1); 
KA1_Cry2=repmat(Ks(:,76)',N,1); 
KA2_Cry2=repmat(Ks(:,77)',N,1); 
KI1_Cry2=repmat(Ks(:,78)',N,1); 
KI2_Cry2=repmat(Ks(:,79)',N,1); 
KI3_Cry2=repmat(Ks(:,80)',N,1); 
KI4_Cry2=repmat(Ks(:,81)',N,1); 
KI5_Cry2=repmat(Ks(:,82)',N,1); 
KA1_Rev_erbalpha=repmat(Ks(:,83)',N,1); 
KI1_Rev_erbalpha=repmat(Ks(:,84)',N,1); 
KI2_Rev_erbalpha=repmat(Ks(:,85)',N,1); 
KI3_Rev_erbalpha=repmat(Ks(:,86)',N,1); 
KI4_Rev_erbalpha=repmat(Ks(:,87)',N,1); 
KA1_Clk=repmat(Ks(:,88)',N,1); 
KI1_Clk=repmat(Ks(:,89)',N,1); 
KA1_Bmal1=repmat(Ks(:,90)',N,1); 
KI1_Bmal1=repmat(Ks(:,91)',N,1); 
KA1_Rorc=repmat(Ks(:,92)',N,1); 
KA2_Rorc=repmat(Ks(:,93)',N,1); 
KI1_Rorc=repmat(Ks(:,94)',N,1); 
KI2_Rorc=repmat(Ks(:,95)',N,1); 
KI3_Rorc=repmat(Ks(:,96)',N,1); 
KI4_Rorc=repmat(Ks(:,97)',N,1); 
KI5_Rorc=repmat(Ks(:,98)',N,1); 
km_Per1=repmat(Ks(:,99)',N,1); 
km_Per2=repmat(Ks(:,100)',N,1); 
km_Cry1=repmat(Ks(:,101)',N,1);
km_Cry2=repmat(Ks(:,102)',N,1);
km_Rev_erbalpha=repmat(Ks(:,103)',N,1);
km_Clk=repmat(Ks(:,104)',N,1);
km_Bmal1=repmat(Ks(:,105)',N,1);
km_Rorc=repmat(Ks(:,106)',N,1);
kp_PER1=repmat(Ks(:,107)',N,1);
kp_PER2=repmat(Ks(:,108)',N,1);
kp_CRY1=repmat(Ks(:,109)',N,1);
kp_CRY2=repmat(Ks(:,110)',N,1);
kp_REV_ERBalpha=repmat(Ks(:,111)',N,1);
kp_CLK=repmat(Ks(:,112)',N,1);
kp_BMAL1=repmat(Ks(:,113)',N,1);
kp_RORc=repmat(Ks(:,114)',N,1);
tPer1=repmat(Ks(:,115)',N,1);
tPer2=repmat(Ks(:,116)',N,1);
tCry1=repmat(Ks(:,117)',N,1);
tCry2=repmat(Ks(:,118)',N,1);
tRev_erbalpha=repmat(Ks(:,119)',N,1);
tClk=repmat(Ks(:,120)',N,1);
tBmal1=repmat(Ks(:,121)',N,1);
tRorc=repmat(Ks(:,122)',N,1);
aPER1_CRY1=repmat(Ks(:,123)',N,1);
aPER1_CRY2=repmat(Ks(:,124)',N,1);
aPER2_CRY1=repmat(Ks(:,125)',N,1);
aPER2_CRY2=repmat(Ks(:,126)',N,1);
aCLK_BMAL1=repmat(Ks(:,127)',N,1);
dPER1_CRY1=repmat(Ks(:,128)',N,1);
dPER1_CRY2=repmat(Ks(:,129)',N,1);
dPER2_CRY1=repmat(Ks(:,130)',N,1);
dPER2_CRY2=repmat(Ks(:,131)',N,1);
dCLK_BMAL1=repmat(Ks(:,132)',N,1);

% dPer1/dt
z(:,1:varNum)=(V0_Per1+V1_Per1.*(CLK_BMAL1.^na1_Per1./(KA1_Per1.^na1_Per1+...
    CLK_BMAL1.^na1_Per1))).*(KI1_Per1.^ni1_Per1./(KI1_Per1.^ni1_Per1+...
    PER1_CRY1.^ni1_Per1)).*(KI2_Per1.^ni2_Per1./(KI2_Per1.^ni2_Per1+...
    PER1_CRY2.^ni2_Per1)).*(KI3_Per1.^ni3_Per1./(KI3_Per1.^ni3_Per1+...
    PER2_CRY1.^ni3_Per1)).*(KI4_Per1.^ni4_Per1./(KI4_Per1.^ni4_Per1+...
    PER2_CRY2.^ni4_Per1))-km_Per1.*Per1;
% dPer2/dt
z(:,varNum+1:2*varNum)=(V0_Per2+V1_Per2.*(CLK_BMAL1.^na1_Per2./(KA1_Per2.^na1_Per2+...
    CLK_BMAL1.^na1_Per2))).*(KI1_Per2.^ni1_Per2./(KI1_Per2.^ni1_Per2+...
    PER1_CRY1.^ni1_Per2)).*(KI2_Per2.^ni2_Per2./(KI2_Per2.^ni2_Per2+...
    PER1_CRY2.^ni2_Per2)).*(KI3_Per2.^ni3_Per2./(KI3_Per2.^ni3_Per2+...
    PER2_CRY1.^ni3_Per2)).*(KI4_Per2.^ni4_Per2./(KI4_Per2.^ni4_Per2+...
    PER2_CRY2.^ni4_Per2))-km_Per2.*Per2;
% dCry1/dt
z(:,2*varNum+1:3*varNum)=(V0_Cry1+V1_Cry1.*(CLK_BMAL1.^na1_Cry1./(KA1_Cry1.^...
    na1_Cry1+CLK_BMAL1.^na1_Cry1))+V2_Cry1.*(RORc.^na2_Cry1./...
    (KA2_Cry1.^na2_Cry1+RORc.^na2_Cry1))).*(KI1_Cry1.^ni1_Cry1./(KI1_Cry1.^ni1_Cry1+...
    PER1_CRY1.^ni1_Cry1)).*(KI2_Cry1.^ni2_Cry1./(KI2_Cry1.^ni2_Cry1+...
    PER1_CRY2.^ni2_Cry1)).*(KI3_Cry1.^ni3_Cry1./(KI3_Cry1.^ni3_Cry1+...
    PER2_CRY1.^ni3_Cry1)).*(KI4_Cry1.^ni4_Cry1./(KI4_Cry1.^ni4_Cry1+...
    PER2_CRY2.^ni4_Cry1)).*(KI5_Cry1.^ni5_Cry1./(KI5_Cry1.^ni5_Cry1+...
    REV_ERBalpha.^ni5_Cry1))-km_Cry1.*Cry1;
% dCry2/dt
z(:,3*varNum+1:4*varNum)=(V0_Cry2+V1_Cry2.*(CLK_BMAL1.^na1_Cry2./(KA1_Cry2.^...
    na1_Cry2+CLK_BMAL1.^na1_Cry2))+V2_Cry2.*(RORc.^na2_Cry2./...
    (KA2_Cry2.^na2_Cry2+RORc.^na2_Cry2))).*(KI1_Cry2.^ni1_Cry2./(KI1_Cry2.^ni1_Cry2+...
    PER1_CRY1.^ni1_Cry2)).*(KI2_Cry2.^ni2_Cry2./(KI2_Cry2.^ni2_Cry2+...
    PER1_CRY2.^ni2_Cry2)).*(KI3_Cry2.^ni3_Cry2./(KI3_Cry2.^ni3_Cry2+...
    PER2_CRY1.^ni3_Cry2)).*(KI4_Cry2.^ni4_Cry2./(KI4_Cry2.^ni4_Cry2+...
    PER2_CRY2.^ni4_Cry2)).*(KI5_Cry2.^ni5_Cry2./(KI5_Cry2.^ni5_Cry2+...
    REV_ERBalpha.^ni5_Cry2))-km_Cry2.*Cry2;
% dRev_erbalpha/dt
z(:,4*varNum+1:5*varNum)=(V1_Rev_erbalpha.*(CLK_BMAL1.^na1_Rev_erbalpha./...
    (KA1_Rev_erbalpha.^na1_Rev_erbalpha+CLK_BMAL1.^na1_Rev_erbalpha))).*...
    (KI1_Rev_erbalpha.^ni1_Rev_erbalpha./(KI1_Rev_erbalpha.^ni1_Rev_erbalpha+...
    PER1_CRY1.^ni1_Rev_erbalpha)).*(KI2_Rev_erbalpha.^ni2_Rev_erbalpha./...
    (KI2_Rev_erbalpha.^ni2_Rev_erbalpha+PER1_CRY2.^ni2_Rev_erbalpha)).*...
    (KI3_Rev_erbalpha.^ni3_Rev_erbalpha./(KI3_Rev_erbalpha.^ni3_Rev_erbalpha+...
    PER2_CRY1.^ni3_Rev_erbalpha)).*(KI4_Rev_erbalpha.^ni4_Rev_erbalpha./...
    (KI4_Rev_erbalpha.^ni4_Rev_erbalpha+PER2_CRY2.^ni4_Rev_erbalpha))-...
    km_Rev_erbalpha.*Rev_erbalpha;
% dClk/dt
z(:,5*varNum+1:6*varNum)=(V0_Clk+V1_Clk.*(RORc.^na1_Clk./(KA1_Clk.^na1_Clk...
    +RORc.^na1_Clk))).*(KI1_Clk.^ni1_Clk./(KI1_Clk.^ni1_Clk+REV_ERBalpha.^ni1_Clk))...
    -km_Clk.*Clk;
% dBmal1/dt
z(:,6*varNum+1:7*varNum)=(V0_Bmal1 + V1_Bmal1.*(RORc.^na1_Bmal1./...
    (KA1_Bmal1.^na1_Bmal1+RORc.^na1_Bmal1))).*(KI1_Bmal1.^ni1_Bmal1./...
    (KI1_Bmal1.^ni1_Bmal1+REV_ERBalpha.^ni1_Bmal1))-km_Bmal1.*Bmal1;
% dRorc/dt
z(:,7*varNum+1:8*varNum)=(V0_Rorc+V1_Rorc.*(CLK_BMAL1.^na1_Rorc./...
    (KA1_Rorc.^na1_Rorc+CLK_BMAL1.^na1_Rorc))+V2_Rorc.*(RORc.^na2_Rorc./...
    (KA2_Rorc.^na2_Rorc+RORc.^na2_Rorc))).*(KI1_Rorc.^ni1_Rorc./(KI1_Rorc.^...
    ni1_Rorc+PER1_CRY1.^ni1_Rorc)).*(KI2_Rorc.^ni2_Rorc./(KI2_Rorc.^...
    ni2_Rorc+PER1_CRY2.^ni2_Rorc)).*(KI3_Rorc.^ni3_Rorc./(KI3_Rorc.^...
    ni3_Rorc+PER2_CRY1.^ni3_Rorc)).*(KI4_Rorc.^ni4_Rorc./(KI4_Rorc.^...
    ni4_Rorc+PER2_CRY2.^ni4_Rorc)).*(KI5_Rorc.^ni5_Rorc./(KI5_Rorc.^...
    ni5_Rorc+REV_ERBalpha.^ni5_Rorc))-km_Rorc.*Rorc;
% dPER1/dt
z(:,8*varNum+1:9*varNum)=tPer1.*Per1-aPER1_CRY1.*PER1.*CRY1-aPER1_CRY2.*...
    PER1.*CRY2+dPER1_CRY1.*PER1_CRY1+dPER1_CRY2.*PER1_CRY2-kp_PER1.*PER1;
% dPER2/dt
z(:,9*varNum+1:10*varNum)=tPer2.*Per2-aPER2_CRY1.*PER2.*CRY1-aPER2_CRY2.*...
    PER2.*CRY2+dPER2_CRY1.*PER2_CRY1+dPER2_CRY2.*PER2_CRY2-kp_PER2.*PER2;
% dCRY1/dt
z(:,10*varNum+1:11*varNum)=tCry1.*Cry1-aPER1_CRY1.*PER1.*CRY1-aPER2_CRY1.*...
    PER2.*CRY1+dPER1_CRY1.*PER1_CRY1+dPER2_CRY1.*PER2_CRY1-kp_CRY1.*CRY1;
% dCRY2/dt
z(:,11*varNum+1:12*varNum)=tCry2.*Cry2-aPER1_CRY2.*PER1.*CRY2-aPER2_CRY2.*...
    PER2.*CRY2+dPER1_CRY2.*PER1_CRY2+dPER2_CRY2.*PER2_CRY2-kp_CRY2.*CRY2;
% dREV_ERBalpha/dt
z(:,12*varNum+1:13*varNum)=tRev_erbalpha.*Rev_erbalpha-kp_REV_ERBalpha.*...
    REV_ERBalpha;
% dCLK/dt
z(:,13*varNum+1:14*varNum)=tClk.*Clk-aCLK_BMAL1.*CLK.*BMAL1+dCLK_BMAL1.*...
    CLK_BMAL1-kp_CLK.*CLK;
% dBMAL1/dt
z(:,14*varNum+1:15*varNum)=tBmal1.*Bmal1-aCLK_BMAL1.*CLK.*BMAL1+dCLK_BMAL1...
    .*CLK_BMAL1-kp_BMAL1.*BMAL1;
% dRORc/dt
z(:,15*varNum+1:16*varNum)=tRorc.*Rorc-kp_RORc.*RORc;
% dPER1_CRY1/dt
z(:,16*varNum+1:17*varNum)=aPER1_CRY1.*PER1.*CRY1-dPER1_CRY1.*PER1_CRY1;
% dPER2_CRY1/dt
z(:,17*varNum+1:18*varNum)=aPER2_CRY1.*PER2.*CRY1-dPER2_CRY1.*PER2_CRY1;
% dPER1_CRY2/dt
z(:,18*varNum+1:19*varNum)=aPER1_CRY2.*PER1.*CRY2-dPER1_CRY2.*PER1_CRY2;
% dPER2_CRY2/dt
z(:,19*varNum+1:20*varNum)=aPER2_CRY2.*PER2.*CRY2-dPER2_CRY2.*PER2_CRY2;
% dCLK_BMAL1/dt
z(:,20*varNum+1:21*varNum)=aCLK_BMAL1.*CLK.*BMAL1-dCLK_BMAL1.*CLK_BMAL1;
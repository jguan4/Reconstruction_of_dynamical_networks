function z = ydot(A,t,y,type) 
switch type
    case 'FitzHugh_Nagumo' 
        varNum = size(A,1);
        [d,P] = createParametersFN(varNum);
        z = ydotFN(A,d,P,varNum,t,y);
    case 'Henon_Map'
        varNum = size(A,1);
        [P, cf]=createParametersHenon(varNum);
        z = henonMap(A,P,cf,t,y);
    case 'Circadian_Rhythm'
        varNum = 21;
        [Ks] = mammalianParameters;
        z = ydotMammalian(Ks,varNum,t,y);
end


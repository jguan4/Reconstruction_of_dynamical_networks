function [A, varNum, dimNum, dynamic, dfuncDefined] = promptInput
%% Ask the user for dynamics and network
strs_dynamics  = {'1. FitzHugh Nagumo', '2. Henon Map', '3. Circadian Rhythm'};
strs_dynamics_path = {'FitzHugh_Nagumo', 'Henon_Map', 'Circadian_Rhythm'};
prmpt = 'Select dynamics from the list below:';
[sd,vd] = listdlg('PromptString',prmpt,'SelectionMode','multi','ListString',strs_dynamics);
dynamic_path = genpath(strcat('./', string(strs_dynamics_path(sd))));
if (sd ~= 3)
    strs_networks  = {'1. Erdos-Renyi', '2. Scale-Free'};
    strs_networks_type = {'Erdos-Renyi', 'Scale-Free'};
    prmpt = 'Select a network from the list below:';
    [sn,vn] = listdlg('PromptString',prmpt,'SelectionMode','multi','ListString',strs_networks);
    prompt = {'Enter number of nodes in the network:'};
    title = 'Input';
    dims = [1 35];
    varNum = inputdlg(prompt,title,dims);
    varNum = str2double(cell2mat(varNum));
    dimNum = 2;
else
    varNum = 21;
    dimNum = 1;
end
A = createNetwork(varNum, string(strs_networks_type(sn)));
dynamic = string(strs_dynamics_path(sd));
dfuncDefined =  exist(strcat(dynamic_path,'/dfunc.m'),'file');
function A = createNetwork(varNum, type)
switch type
    case 'Erdos-Renyi'
        prompt = {'Enter the connection percentage:'};
        title = 'Input';
        dims = [1 35];
        cnpr = str2double(cell2mat(inputdlg(prompt,title,dims)));
        A = createRandomNetwork(varNum, cnpr);
    case 'Scale-Free'
        prompt = {'Enter the number of connections per node:'};
        title = 'Input';
        dims = [1 35];
        cnnum = str2double(cell2mat(inputdlg(prompt,title,dims)));
        A = createScaleFreeNetwork(varNum, cnnum);
end
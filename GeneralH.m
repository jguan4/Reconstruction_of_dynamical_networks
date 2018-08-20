function H=GeneralH(varNum,varMeasured)
varMeasured=varMeasured(:,any(varMeasured,1));
locations=varMeasured;
locations=sort(locations);
H=zeros(size(locations,2),varNum);%build H
%build H
for i=1:size(locations,2)
    H(i,locations(i))=1;
end

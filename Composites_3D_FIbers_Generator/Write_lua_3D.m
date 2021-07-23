function fid = Write_lua_3D(intersection, face, fid)


for i = 1:size(intersection,1)
    if i==1
        fprintf(fid, 'local fiberNodes = { ')
        fprintf(fid, '\n{%.4f, %.4f, %.4f},', intersection(i,1), intersection(i,2),intersection(i,3));
    elseif i==size(intersection,1)
        fprintf(fid, '\n{%.4f, %.4f, %.4f},\n}', intersection(i,1), intersection(i,2),intersection(i,3));
    else 
        fprintf(fid, '\n{%.4f, %.4f, %.4f},', intersection(i,1), intersection(i,2),intersection(i,3));    
    end    
end
    if size(intersection,1) == 1
       fprintf(fid, '\n}');
    end

% Create general informations:
count = 1;
cc = 2;
nnn = zeros(length(intersection),2);        % Atenção para esta incidência nodal!!!
for i=1:length(intersection)
   nnn(i,:) = [count,cc]; 
   cc = cc + 2;
   count = count + 2; 
end

elem = 1;
type = 1;
comp = 1;
cin = 1;

for i = 1:2:size(intersection,1)
    if i==1
        fprintf(fid, '\n');
        fprintf(fid, '\nlocal fiberData = { '); 
        fprintf(fid, '\n{%d, %d, %d, %d, %d, %d, %d},\n',...
        face(i,2),type,comp,face(i,1),nnn(cin,1),face(i+1,1),nnn(cin,2)); 
    elseif i==size(intersection,1)
        fprintf(fid, '{%d, %d, %d, %d, %d, %d, %d}, \n}',...
        face(i,2),type,comp,face(i,1),nnn(cin,1),face(i+1,1),nnn(cin,2));
        fprintf
    else
        fprintf(fid,'{%d, %d, %d, %d, %d, %d, %d},\n',...
        face(i,2),type,comp,face(i,1),nnn(cin,1),face(i+1),nnn(cin,2));
    end
    cin = cin + 1; 
end 
    if size(intersection,1) == 1
       fprintf(fid, '}');
    end
    
fprintf(fid,'\n local data ={fiberNodes, fiberData} \n return data'); 
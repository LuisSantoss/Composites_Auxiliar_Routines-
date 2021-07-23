function [n,M,limits] = Planger(coord)
% Geração de arestas que limitam planos: 
AB = coord(2,:) - coord(1,:); 
AD = coord(4,:) - coord(1,:); 
AC = coord(3,:) - coord(1,:);

pvet1 = norm(cross(AB,AC)); 
pvet2 = norm(cross(AB,AD));

if pvet1 == 0 || pvet2 == 0
    fprintf('colinearidade!!!\n');
end 
planxlim = [min(coord(:,1)), max(coord(:,1))];
planylim = [min(coord(:,2)), max(coord(:,2))];
planzlim = [min(coord(:,3)), max(coord(:,3))];
% Outputs:
limits = [planxlim;planylim;planzlim];
n = cross(AB,AD)/sqrt(dot(cross(AB,AD),cross(AB,AD)));    % vetor normal ao plano. 
M = coord(1,[1 3 2]); 






% ---------------------------------------------------------------------- % 
% Pontificie Universidade Catolica do Rio de Janeiro e TECGRAF Institute %
% Autor: Luis Felipe dos Santos Ribeiro                       Julho/2021 %
% Program to create a random fiber dispersion or specific fiber dispersi %
% on - Some changes shold be made.                                       % 
% ---------------------------------------------------------------------- %
clc; clear all; close all;
% Input Informations: 
x=[0 3.655];                   % X model's limits.
y=[0 0.560];                    % Y model's limits.
z=[0 0.305];                    % Z model's limits. 
L=3.655;                       % Fiber's sizes. 
N=4;                            % Number of fibers. 
% Flag to plot graphical informatios:
show = [1 1 0];                 % [elements mesh, fibers, node info]; 
fid = fopen('_data.lua', 'wt'); % Output's (_data.lua) name. ; 
%% Fiber creator: 
[u,N0,Fiber] = Generate_Fiber(x,y,z,L,N);
%% Leitor da malha: 
Nodes = xlsread('s1.xlsx', 'Nodes');
Nodalinc = xlsread('s1.xlsx','Incidencia'); 
Nelems = size(Nodalinc,1);
Nnodes = size(Nodalinc,2); 
%% Loop para cada elemento:
cc = 0;
for e = 1:Nelems      
%% Faces correction by indeterminacy kinematics:
f1 = [1 4 3 2];f2 = [1 2 6 5];f3 = [2 3 7 6];
f4 = [3 4 8 7];f5 = [1 5 8 4];f6 = [5 6 7 8];
faces = [f1;f2;f3;f4;f5;f6];
%% Fibers loop:
for f=1:N
    uu = u(f,:);                 % Director vector of the fiber
    NN0 = N0(f,:);               % Point in the fiber
    %% Nodal corrections by indeterminacy kinematics:
    for ff=1:6 
        c = 1; 
        for j = 1:4
           % Faces correction by indeterminacy kinematics   
            pos = faces(ff,j);    
            f_corrigida(1,j) = Nodalinc(e,pos);                     
        end
        % Edge coordinates considering corrected faces: 
        coord_arestas = [Nodes(f_corrigida(1),:); Nodes(f_corrigida(2),:) ; Nodes(f_corrigida(3),:) ; Nodes(f_corrigida(4),:)]; 
        % Determination of the normal line and the point contained in the plane of the face:
        [n,M,limits] = Planger(coord_arestas);   
        % Determination of the straight plane intersection point: 
        [I,rc] = Line_Plane_Intersection(uu, NN0, n, M);
        % Limitação do plano infinito para região da face:  
        if isempty(I) == 0
            if (I(1) >= limits(1,1)) && (I(1) <= limits(1,2)) && (I(2) >= limits(2,1)) && (I(2) <= limits(2,2)) && (I(3) >= limits(3,1)) && (I(3) <= limits(3,2))
                cc=cc+1;
                face(cc,:) = [ff,e];
                intersection(cc,:) = I;
            end
        end
    end
end
end
%% Plot mesh and intersections: 
noselem = zeros(8,3);
for j = 1:8 
 noselem (j,:) = Nodes(Nodalinc(1,j),:);
end
%% Write _data.lua
fid = Write_lua_3D(intersection, face, fid);
fclose(fid);
%%  Ploter 
PlotMesh(Fiber,Nodes,Nodalinc,show);
fclose('all');





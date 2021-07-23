function [u,N0,Fiber] = Generate_Fiber(x,y,z,L,N)
%% Description:
%x=[x1 x2]: x boundaries of the box
%y=[y1 y2]: y boundaries of the box
%z=[z1 z2]: z boundaries of the box
%L: Length of fibers
%N: Number of fibers
%output
%Fiber: (N,6) matrix of fiber coordinates with (:,1), (:,2) and (:,3) are x,y, and z coordinates of one end 
%and (:,4),(:,5) and (:,6) are x,y, and z coordinates of the other end.  

%% Code 
widthx = x(2) - x(1);
widthy = y(2) - y(1);
widthz = z(2) - z(1);
% Inicialização dos vetores de coordenadas noisi iniciais. 
% N0 = zeros(N,3);
% u = zeros(N,3); 

for i=1:1:N  
% Posição inicial aleatória:
% x1=min(x)+(max(x)-min(x))*rand(1);
% y1=min(y)+(max(y)-min(y))*rand(1);
% z1=min(z)+(max(z)-min(z))*rand(1);
% Posição inicial pré-definida:
init_bar_pos = [0,0.0635,0.05;0,0.127,0.05;0,0.0635,0.255;0,0.127,0.255];
x1 = init_bar_pos(i,1);  
y1 = init_bar_pos(i,2);
z1 = init_bar_pos(i,3);
% Initial coordenates: 
N0(i,:) = init_bar_pos(i,:);
u = [1 0 0;1 0 0;1 0 0;1 0 0];
% u(i,:) = u;
cond = 1;

while (cond)
        % Random angle
% 	    angle = 2*pi*rand(1);
%       angle = 2*pi;      To use a expecific orientation. 
        % fiber final coordinates
        Dr = 1;
        c2 = [x1 y1 z1]'+Dr*[L 0 0]'; 
        endX = c2(1);
        endY = c2(2);
        endZ = c2(3);      
        Xend = [endX,endY,endZ];
        % Check if fiber is inside the rectangle
        if((endX>=0) && (endX<=widthx) && (endY>=0) && (endY<=widthy)&& (endZ>=0) && (endZ<=widthz)) 
            % Add fiber
            cond = 0;
            Fiber(i,:) = [x1 y1 z1 endX endY endZ];
        else
            cond = 1;
       end
    end

end
end 

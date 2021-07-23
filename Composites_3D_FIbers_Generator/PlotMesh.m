function PlotMesh(Fiber,coordinates,nodes,show)

dimension = size(coordinates,2);         % Dimension of the mesh
nel = size(nodes,1);                     % number of elements
nnode = size(coordinates,1) ;            % total number of nodes in system
nnel = size(nodes,2);                    % number of nodes per element
%% Initialization of the required matrices:
X = zeros(nnel,nel) ;
Y = zeros(nnel,nel) ;
Z = zeros(nnel,nel) ;
%% Descrição das faces:         
f1 = [1 4 3 2];f2 = [1 2 6 5];f3 = [2 3 7 6];
f4 = [3 4 8 7];f5 = [1 5 8 4];f6 = [5 6 7 8];
fm = [f1;f2;f3;f4;f5;f6];
%% Nós:
XYZ = cell(1,nel);        
for e=1:nel
 nd=nodes(e,:);
 X(:,e) = coordinates(nd,1) ;
 Y(:,e) = coordinates(nd,3) ;
 Z(:,e) = coordinates(nd,2) ;
 XYZ{e} = [X(:,e)  Y(:,e) Z(:,e)] ;
end      
%% Plot FEM mesh 
if show(1) == 1
figure
set(gcf,'color','w')
% axis on 
cellfun(@patch,repmat({'Vertices'},1,nel),XYZ,.......
        repmat({'Faces'},1,nel),repmat({fm},1,nel),......
        repmat({'FaceColor'},1,nel),repmat({'none'},1,nel));
% view(3)
view(60,30);
daspect([1 1 1]);
set(gca,'XTick',[]) ; set(gca,'YTick',[]); set(gca,'ZTick',[]) ;
end 
%% display Node numbers and Element numbers
if show(3) == 1
%% Plot número do Nó:
 k = 1:nnode ;
 nd = k' ;
for i = 1:nnel
 text(X(i,1),Y(i,1),Z(i,1),int2str(nd(i)),....
 'fontsize',8,'color','k');
end
%% Plot Número do Elemento:
for i = 1:nel
  text(sum(X(:,i))/8,sum(Y(:,i))/8,sum(Z(:,i))/8,int2str(i),.....
  'fontsize',8,'color','r') ;
end
end
%% Plot Fibers:
if show(2) == 1
for i=1:size(Fiber,1)
 x1=Fiber(i,1);
 y1=Fiber(i,2);
 z1=Fiber(i,3);
 x2=Fiber(i,4);
 y2=Fiber(i,5);
 z2=Fiber(i,6);            
 line([x1 x2],[z1 z2],[y1 y2],'Linewidth',3,'Color','red');
end     
end
end

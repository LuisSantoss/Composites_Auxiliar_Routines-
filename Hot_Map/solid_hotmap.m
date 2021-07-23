function [] = solid_hotmap(nodes,solid_inc,fibers,show)
nelem = size(solid_inc,1); 
nnode = size(nodes,1);
elem = fibers(:,1); 
%% Plot interface mesh:  
for i = 1:nelem 
    nd = solid_inc(i,:);
    x(:,i) = nodes(nd,1); 
    y(:,i) = nodes(nd,2); 
end
if show(1) == 1
    figure(2)
    fill(x,y,'w')
    title('Hotmap of fibers in continuous elements ')
    axis off;
    hold on;
end
% Plotting name and fibers number:
if show(2) == 1
    k = 1:nnode;
    nint = size(fibers,1); 
    nd = k';
    c = 0;
    info = zeros(nelem,2); 
    info(:,1) = [1:nelem]';
    for i = 1:nint
        e = fibers(i,1); 
        info(e,2) = [info(e,2)+1];
    end    
%     for i = 1:nelem
%         text(sum(x(:,i))/4,sum(y(:,i))/3.8,int2str(info(i,2)),'fontsize',10,'color','b') ;
%     end
    patch(x,y,info(:,2))
    colorbar
end
end 
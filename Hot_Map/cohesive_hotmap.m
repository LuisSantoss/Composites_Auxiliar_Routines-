function [] = cohesive_hotmap(nodes,int_inc,fibers,show)
nelem_int = size(int_inc,1); 
nnode = size(nodes,1);
elem = fibers(:,1); 
%% Plot interface mesh:  
for i = 1:nelem_int 
    nd = int_inc(i,:);
    x(:,i) = nodes(nd,1); 
    y(:,i) = nodes(nd,2); 
end

if show(1) == 1
    figure(1)
    fill(x,y,'w')
    title('Hotmap of fibers in Interface mesh')
    axis off;
    hold on; 
end
% Plotting name and fibers number:
if show(2) == 1
    k = 1:nnode;
    nint = size(fibers,1); 
    nd = k';
    c = 0;
    info = zeros(nelem_int,2); 
    info(:,1) = [1:nelem_int]';
    for i = 1:nint
        e = fibers(i,1); 
        info(e,2) = [info(e,2)+1];
    end    
    for i = 1:nelem_int
        text(sum(x(:,i))/4,sum(y(:,i))/4,int2str(info(i,2)),'fontsize',8,'color','r') ;
    end
end
end 
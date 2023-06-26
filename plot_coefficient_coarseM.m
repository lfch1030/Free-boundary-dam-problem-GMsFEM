% surf(k)
% view(0,-90)
% hold on
coeF=figure;
k=k1perm;
image(fliplr(k'))
hold on
map1=[0.7,0.7,0.7;0.3,0.3,0];
for i=0:size(k,1)
    
plot([0,100], [i,i],'Color',[0 0 0],'LineWidth',0.2)
hold on
plot([i,i], [0,100],'Color',[0 0 0],'LineWidth',0.2)

end
for i=1:Nx
    
plot([0,100], [100*(i-1)/Nx,100*(i-1)/Nx],'Color',[0.3 0.3 1],'LineWidth',1)
hold on
plot([100*(i-1)/Nx,100*(i-1)/Nx], [0,100],'Color',[0.3 0.3 1],'LineWidth',1)
colormap(map1);
end

exportgraphics(coeF,['figure\Coeff',Medium,'.pdf'],'ContentType','vector')
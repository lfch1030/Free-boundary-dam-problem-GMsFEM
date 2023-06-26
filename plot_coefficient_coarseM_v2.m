% surf(k)
% view(0,-90)
% hold on
coeF=figure;
k=k1perm;
k=fliplr(flipud(k')');
image(flipud(k'))
hold on
map1=[0.8588,0.898,0.8902;0.1804,0.3333,0.4588];
for i=0:size(k,1)

    plot([0,100], [i,i],'Color',[0.5 0.5 0.5],'LineWidth',0.2)
    hold on
    plot([i,i], [0,100],'Color',[0.5 0.5 0.5],'LineWidth',0.2)

end
for i=1:Nx

    plot([0,100], [100*(i-1)/Nx,100*(i-1)/Nx],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)
    hold on
    plot([100*(i-1)/Nx,100*(i-1)/Nx], [0,100],'Color',[0.8588,0.1804,0.1804],'LineWidth',1)
    colormap(map1);
end

exportgraphics(coeF,['figure\Coeff',Medium,'.pdf'],'ContentType','vector')
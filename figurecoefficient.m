%mu=10^5-1;
read_perm_juan
k1perm=k1;
[X,Y]=meshgrid(linspace(0,1,100));
Z=coeficient(X,Y,mu,k1perm);
Z=reshape(Z,size(X,1),size(X,2));
surf(X,Y,Z);
maxv=max(max(Z));
view(2)
shading flat 
axis square
hold on
for i1=1:Nx
    for i2=1:Ny
        xcor=0+i1/Nx;
        ycor=0+i2/Ny;
        plot3([0,1], [ycor,ycor],[maxv+1,maxv+1],'k', 'LineWidth',2)
        plot3([xcor,xcor], [0,1],[maxv+1,maxv+1],'k', 'LineWidth',2)
    end
end

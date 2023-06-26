
nv=size(x,1);
vx=z(1:nv)';
vy=z(nv+1:2*nv)';

for i1=1:Nx
    for i2=1:Ny
        Ig=dom(i1,i2).Ig;
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        figure(1)
        trisurf(M,v(:,1),v(:,2),vx(Ig))
        hold on
        figure(2)
        trisurf(M,v(:,1),v(:,2),vy(Ig))
        hold on
        figure(3)
                for i=1:dom(i1,i2).mesh.ne
         trimesh([1,2,3],vx( Ig(M(i,:)) ),vy( Ig(M(i,:)) ) )

        hold on
        end
    end
end


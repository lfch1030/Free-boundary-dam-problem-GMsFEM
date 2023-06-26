
nv=size(x,1);
vx=z(1:nv)';
vy=z(nv+1:2*nv)';

for i1=1:Nx
    for i2=1:Ny
        Ig=dom(i1,i2).Ig;
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        vnew=[vx(Ig),vy(Ig)];
        dom(i1,i2).vnew=vnew;
    end
end


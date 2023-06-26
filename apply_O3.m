function w=apply_O3(u,dom,Nx,Ny)
Au=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1
    A=dom(i1,i2).Bdown;
    free=dom(i1,i2).free;
    AI=A(free,free);
    Igfree=dom(i1,i2).Igfree;
    lu=u(Igfree);
    lAu=AI*lu;
    Au(Igfree)=Au(Igfree)-lAu; % negative because of normal
    end
end



for i1=1:Nx
    for i2=Ny
    A=dom(i1,i2).Bup;
    free=dom(i1,i2).free;
    AI=A(free,free);
    Igfree=dom(i1,i2).Igfree;
    lu=u(Igfree);
    lAu=AI*lu;
    Au(Igfree)=Au(Igfree)+lAu;
    end
end







w=Au;


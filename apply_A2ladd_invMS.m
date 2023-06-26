function w=apply_A2ladd_invMS(u,dom_ov,Nx,Ny,A0,dir)
w=sparse(size(u,1),size(u,2));

for i1=2:Nx
    for i2=2:Ny
    AI=dom_ov(i1,i2).A;
    Igfree=dom_ov(i1,i2).Igfree;
    free=dom_ov(i1,i2).free;
    lu=u(Igfree);
    lAu=AI(free,free)\lu;
    w(Igfree)=w(Igfree)+lAu;
    
    end
end

%w0=apply_P0BADBd(u,dom_ov,Nx,Ny,A0,dir,[],[],[]);

%w=w+w0;
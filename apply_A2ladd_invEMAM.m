function w=apply_A2ladd_invEMF(u,dom_ov,Nx,Ny,A0)
w=sparse(size(u,1),size(u,2));

for i1=1:Nx-1
    for i2=1:Ny-1
    AI=dom_ov(i1,i2).A;
    Igfree=dom_ov(i1,i2).Igfree;
    free=dom_ov(i1,i2).free;
    lu=u(Igfree);
    lAu=AI(free,free)\lu;
    w(Igfree)=w(Igfree)+lAu;
    end
end

w0=apply_P0EMAM(u,dom_ov,Nx,Ny,A0);

w=w+w0;
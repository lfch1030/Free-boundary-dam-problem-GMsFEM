function w=applay_Aadd_inv1D(u,dom_ov,Nx)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    A=dom_ov(i1).A;
    Ig=dom_ov(i1).Ig;
    Igfree=Ig(2:dom_ov(i1).mesh.nex);
    free=2:dom_ov(i1).mesh.nex;
    lu=u(Igfree);
    AI=A(free,free);
    lAu=AI\lu;
    w(Igfree)=w(Igfree)+lAu;
end

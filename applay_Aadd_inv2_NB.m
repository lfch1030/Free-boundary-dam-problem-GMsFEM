function w=applay_Aadd_inv2_NB(u,dom,dom_ov,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=2:Nx
    for i2=2:Ny
    AI=dom_ov(i1,i2).A;
    Igfree=dom_ov(i1,i2).Igfree;
    free=dom_ov(i1,i2).free;
    lu=u(Igfree);
    lAu=AI(free,free)\lu;
    w(Igfree)=w(Igfree)+lAu;
plot_vector(w, dom,Nx,Ny,1,[]);
pause(0.2)
    end
end

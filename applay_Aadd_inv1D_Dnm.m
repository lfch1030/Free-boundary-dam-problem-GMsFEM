function applay_Aadd_inv1D_Dnm(u,d,dom,dom_ov,dom_ov2,Nx,A0,psize,Niter,xpc)



w=sparse(size(u,1),size(u,2));
w=d;
plot_vector1Dsol(xpc,dom,Nx)
hold on
plot_vector1D(w,dom,Nx)
hold off




for iter=1:Niter
for i1=1:Nx
    A=dom_ov(i1).A;
    Ig=dom_ov(i1).Ig;
    
    Igfree=Ig(2:dom_ov(i1).mesh.nex);
    free=2:dom_ov(i1).mesh.nex;
    lu=u(Ig);
    ld=d(Ig)';
    AI=A(free,free);
    rhs=lu-A*ld';
    lAu=lu*0;
    lAu(free)=AI\rhs(free);
    w(Ig)=lAu+ld';
    plot_vector1Dsol(xpc,dom,Nx)
hold on

    plot_vector1D(w,dom,Nx)
    text(0.9,0.11,num2str(iter), 'FontSize', 20)
    axis([-0.05 1.05 -0.01 0.14])
    pause
    
    box off
    hold off
    d=w;
end
end


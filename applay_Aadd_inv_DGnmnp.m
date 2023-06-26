function applay_Aadd_inv_DGnmnp(u,d,dom, dom_ov,Nx,Ny,mu,spause,Niter)


w=sparse(size(u,1),size(u,2))+d;
% Au=applay_A(u,dom,Nx,Ny);
% eu=dot(u,Au);

plot_vector(d, dom,Nx,Ny,mu,[]);
%shading flat
axis([0 1 0 1 0 0.1])
pause
%view((frame+45)/10,30)
% %shading flat
% plot_mesh(dom,Nx,Ny)

for ni=1:Niter
for i1=1:Nx
    for i2=1:Ny    
        waux=sparse(size(u,1),size(u,2));

    AI=dom_ov(i1,i2).A;
    Igfree=dom_ov(i1,i2).Igfree;
    Ig=dom_ov(i1,i2).Ig;
    free=dom_ov(i1,i2).free;
    lu=u(Ig);
    ld=0*u(Ig);
    
    n=size(AI,1);
    boundary=setdiff(1:n,free);
    boundaryg=Ig(boundary);
    ld(boundary)=d(boundaryg);
waux(boundaryg)=d(boundaryg);


rhs=lu-AI*ld;
    lAu=ld*0;
    lAu(free)=AI(free,free)\rhs(free);
%     wi=w*0;
%     wi(Igfree)=lAu;
    w(Ig)=lAu+ld;



%     Awi=applay_A(wi,dom,Nx,Ny);
%     eui((i1-1)*Ny+i2)=dot(Awi,wi);

plot_vector(w, dom,Nx,Ny,mu,[]);
    text(0.9,0.9,0.09,num2str(ni),'FontSize',20);
axis([0 1 0 1 0 0.1])
%shading flat
    pause(0.1)
%     %shading flat
%view((frame+45)/10,30)
hold off
    d=w;
    end
end
end
% max(eui./eu)
% pause

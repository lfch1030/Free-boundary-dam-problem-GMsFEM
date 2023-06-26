function unew=applay_Amul_nonov(u,b,dom, dom_ov,Nx,Ny)
%w=sparse(size(u,1),size(u,2));
% Au=applay_A(u,dom,Nx,Ny);
% eu=dot(u,Au);
uold=u;
unew=u;
for i1=1:Nx
    for i2=1:Ny
    AI=dom(i1,i2).A;
    Igfree=dom(i1,i2).Igfreedir;
    free=dom(i1,i2).freedir;
    lu=b(dom(i1,i2).Ig)-AI*uold(dom(i1,i2).Ig);
    lAu=AI(free,free)\lu(free);
%     wi=w*0;
%     wi(Igfree)=lAu;
    unew(Igfree)=uold(Igfree)+lAu;
%     Awi=applay_A(wi,dom,Nx,Ny);
%     eui((i1-1)*Ny+i2)=dot(Awi,wi);
uold=unew;
    end
end
% max(eui./eu)
% pause
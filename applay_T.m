function w=applay_T(u,dom_ov,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    M=dom_ov(i1,i2).A;
    AI=dom_ov(i1,i2).A;
    Igfree=dom_ov(i1,i2).Igfree;
    free=dom_ov(i1,i2).free;
    uaux=M(free,free)*u(Igfree);
%    lu=uaux(Igfree);


    lAu=AI(free,free)\uaux;
    w(Igfree)=w(Igfree)+lAu;
    end
end

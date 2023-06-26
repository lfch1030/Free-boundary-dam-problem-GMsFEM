function w=applay_TI(u,dom_ov,i1,i2)
w=sparse(size(u,1),size(u,2));

M=dom_ov(i1,i2).A;
    AI=dom_ov(i1,i2).A;
    Igfree=dom_ov(i1,i2).Igfree;
    free=dom_ov(i1,i2).free;
    uaux=M(free,free)*u(Igfree);
%    lu=uaux(Igfree);


    lAu=AI(free,free)\uaux;
    w(Igfree)=w(Igfree)+lAu;

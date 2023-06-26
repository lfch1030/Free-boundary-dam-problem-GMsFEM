function w=applay_AMI_inv(u,dom_ov,i1,i2)
w=sparse(size(u,1),size(u,2));

    AI=dom_ov(i1,i2).A;
    MI=dom_ov(i1,i2).Mass;
    AI=AI+MI;
    Igfree=dom_ov(i1,i2).Igfree;
    free=dom_ov(i1,i2).free;
    lu=u(Igfree);
    lAu=AI(free,free)\lu;
    w(Igfree)=w(Igfree)+lAu;

    
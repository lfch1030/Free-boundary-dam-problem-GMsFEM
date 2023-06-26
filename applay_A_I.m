function w=applay_A_I(u,dom,i1,i2)

Au=sparse(size(u,1),size(u,2));

    AI=dom(i1,i2).A;
    Igfree=dom(i1,i2).Igfree;
    free=dom(i1,i2).free;
    lu=u(Igfree);
%    whos lu Igfree aaux
    lAu=AI(free,free)*lu;
    Au(Igfree)=Au(Igfree)+lAu;

    w=Au;
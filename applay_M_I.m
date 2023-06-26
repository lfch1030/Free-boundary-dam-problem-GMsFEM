function w=applay_M_I(u,dom,i1,i2)
Au=sparse(size(u,1),size(u,2));
        M=dom(i1,i2).Mass;
    Ig=dom(i1,i2).Ig;
    lu=u(Ig);
    lAu=M*lu;
    Au(Ig)=Au(Ig)+lAu;

    w=Au;
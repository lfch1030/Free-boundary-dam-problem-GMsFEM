function w=cut_I(u,dom,i1,i2)

w=sparse(size(u,1),size(u,2));

    Ig=dom(i1,i2).Ig;
    free=dom(i1,i2).free;
    w(Ig)=u(Ig);

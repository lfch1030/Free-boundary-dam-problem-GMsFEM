function w=applay_AII_inv_local(u,dom,i1,i2)

Su=sparse(size(u,1),size(u,2));

    A=dom(i1,i2).A;
    Ig=dom(i1,i2).Ig;
    B=dom(i1,i2).B;
    bry=[B.vup;B.vleft;B.vdown;B.vright];
    It=1:size(Ig,2);
    G=unique(bry);
    I=setdiff(It,G);
    Gg=Ig(G);
    IIg=Ig(I);

    lu=u(IIg);
    AII=A(I,I);
    AIG=A(I,G);
    AGI=A(G,I);
    AGG=A(G,G);
    
 %   SuG=AGG*lu;
    lsol=AII\(lu);
    lSu=lsol;
Su(IIg)=lSu;
w=Su;
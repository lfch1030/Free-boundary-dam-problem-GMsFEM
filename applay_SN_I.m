function w=applay_SN_I(u,dom,i1,i2,Nx,Ny)

Su=sparse(size(u,1),size(u,2));
    A=dom(i1,i2).A;
    Ig=dom(i1,i2).Ig;
    B=dom(i1,i2).B;
    bry=[B.vup;B.vleft;B.vdown;B.vright];
    It=1:size(Ig,2);
    G=unique(bry);
    G2=G;

    I=setdiff(It,G);
    Gg=Ig(G2);
%    G3=setdiff(G,G2);
%    Gg3=Ig(G3);
    lu=u(Gg);
    AII=A(I,I);
    AIG=A(I,G2);
    AGI=A(G2,I);
    AGG=A(G2,G2);
    
    SuG=AGG*lu;
    lsol=AII\(AIG*lu);
    lSu=SuG-AGI*lsol;
Su(Gg)=lSu;
w=Su;
%w(Gg3)=0;

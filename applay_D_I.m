function w=applay_D_I(u,dom,i1,i2,Nx,Ny)

    D=dom(i1,i2).phiCB;
    Ig=dom(i1,i2).Ig;
    B=dom(i1,i2).B;
    bry=[B.vup;B.vleft;B.vdown;B.vright];
    It=1:size(Ig,2);
    G=unique(bry);
    G2=G;
    if (i1==1)
        G2=setdiff(G2,B.vleft);
    end
    if (i1==Nx)
        G2=setdiff(G2,B.vright);
    end
    if (i2==1)
        G2=setdiff(G2,B.vdown);
    end
    if (i2==Ny)
        G2=setdiff(G2,B.vup);
    end

    I=setdiff(It,G);
    Gg=Ig(G2);
%    G3=setdiff(G,G2);
%    Gg3=Ig(G3);
    lu=u(Gg);
%     AII=A(I,I);
%     AIG=A(I,G2);
%     AGI=A(G2,I);
%     AGG=A(G2,G2);
    
%    SuG=*lu;
%    lsol=AII\(AIG*lu);
%    lSu=SuG-AGI*lsol;
w=D.*u;
%w(Gg3)=0;

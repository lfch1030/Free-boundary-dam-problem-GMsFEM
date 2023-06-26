function w=applay_S_Iinv(u,dom,i1,i2,Nx,Ny)

Su=sparse(size(u,1),size(u,2));
    A=dom(i1,i2).A;
    Ig=dom(i1,i2).Ig;
    B=dom(i1,i2).B;
    bry=[B.vup;B.vleft;B.vdown;B.vright];
    It=1:size(Ig,2);
    G=unique(bry);
    G2=G;
    f=1;
    if (i1==1)
        G2=setdiff(G2,B.vleft);
        f=0;
    end
    if (i1==Nx)
        G2=setdiff(G2,B.vright);
        f=0;
    end
    if (i2==1)
        G2=setdiff(G2,B.vdown);
        f=0;
    end
    if (i2==Ny)
        G2=setdiff(G2,B.vup);
        f=0;
    end

    I=setdiff(It,G);
    Gg=Ig(G2);
%    G3=setdiff(G,G2);
%    Gg3=Ig(G3);
    lu=u(Gg);
    rhs=u(Ig)*0;
    rhs(G2)=lu;
    
    if f==0
        AF=A([I,G2'],[I,G2']);
        solaux=AF\rhs([I,G2']);
        sol=rhs*0;
        sol([I,G2'])=solaux;
    else
        vones=rhs*0+1;
        lambda=dom(i1,i2).Mass*vones;
        rhs0=rhs;%-(dot(lambda,rhs)/dot(lambda,vones))*vones;
        Aex=[A,lambda; lambda',0];
        sol=Aex\[rhs0;0];
    end
        Su(Gg)=sol(G2);

    w=Su;
%w(Gg3)=0;

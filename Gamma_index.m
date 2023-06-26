function GT=Gamma_index(dom,Nx,Ny)
GT=[];
for i1=[1,Nx]
    for i2=1:Ny
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
    G3=setdiff(G,G2);
    G3=Ig(G3);
    GT=[GT,G3];
    GT=unique(GT);
    end
end


for i1=1:Nx
    for i2=[1,Ny]
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
    G3=setdiff(G,G2);
    G3=Ig(G3);
    GT=[GT,G3];
    GT=unique(GT);
    end
end

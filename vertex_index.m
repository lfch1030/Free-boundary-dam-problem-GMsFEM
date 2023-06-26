function GT=vertex_index(dom,Nx,Ny)
GT=[];
for i1=1:Nx
    for i2=1:Ny
    Ig=dom(i1,i2).Ig;
    B=dom(i1,i2).B;
    nvx=size(B.vup,1);
    nvy=size(B.vleft,1);
    vbry=[B.vup([1,nvx]);B.vleft([1,nvy]);B.vdown([1,nvx]);B.vright([1,nvy])];
    It=1:size(Ig,2);
    G=unique(vbry);
    G2=G;
    if (i1==1)
        G2=setdiff(G2,B.vleft([1,nvy]));
    end
    if (i1==Nx)
        G2=setdiff(G2,B.vright([1,nvy]));
    end
    if (i2==1)
        G2=setdiff(G2,B.vdown([1,nvx]));
    end
    if (i2==Ny)
        G2=setdiff(G2,B.vup([1,nvx]));
    end
    G2=Ig(G2);
    GT=[GT,G2];
    GT=unique(GT);
    end
end


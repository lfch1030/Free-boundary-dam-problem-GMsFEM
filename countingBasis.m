function dom=countingBasis(x,dom,cf,Nx,Ny,mu)

for i1=1:Nx
    for i2=1:Ny
        cfb=sparse(size(x,1),size(x,2));
        vx=dom(i1,i2).v(:,1);
        vy=dom(i1,i2).v(:,2);
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
        cfb(Gg)=sum(dom(i1,i2).coeff)./cf(Gg);
        dom(i1,i2).phiCB=cfb;
    end
end

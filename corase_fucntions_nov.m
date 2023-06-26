function dom=corase_fucntions_nov(x,dom,Nx,Ny)

cf=counting(x,dom,Nx,Ny)
for i1=1:Nx
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

        I=setdiff(It,G);
        Gg=Ig(G2);
        phi=0*x;
        phi(Gg)=1./cf(Gg)
        dom(i1,i2).phiC=phi;

    end
end

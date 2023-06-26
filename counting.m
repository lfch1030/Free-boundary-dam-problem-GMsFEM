function [cf,dom]=counting(x,dom,Nx,Ny,mu,k1perm)

dom=piecewisecoeff2D(dom,Nx,Ny,mu,k1perm);
cf=sparse(size(x,1),size(x,2));
for i1=1:Nx
    for i2=1:Ny
        hx=dom(i1,i2).mesh.hx;
        hy=dom(i1,i2).mesh.hy;
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
        cf(Gg)=sum(dom(i1,i2).coeff)+cf(Gg);
%        plot_vector(cf, dom,Nx,Ny,mu,[])
%        pause
    end
end

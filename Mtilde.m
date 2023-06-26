function dom=Mtilde(dom,dom_ov,Nx,Ny,mu,k1perm)

dom=piecewisecoeff2D(dom,Nx,Ny,mu,k1perm);

for i1=1:Nx
    for i2=1:Ny
                M=dom(i1,i2).M;
                v=dom(i1,i2).v;
                col=dom(i1,i2).Ig;
                mesh=dom(i1,i2).mesh;
                ktilde=0;
        for j1=1:Nx+1
            for j2=1:Ny+1
                x=dom_ov(j1,j2).philin;
                u=x(col);
                [gradx,grady,Mpx,Mpy,Mpz]=grad_comp(u,M,v,mesh);
                gradsquare=gradx.^2+grady.^2;
                termtilde=coeficient(Mpx,Mpy,mu,k1perm).*(gradsquare);
                ktilde=ktilde+termtilde;



            end
        end
%        Masstilde=NMassmatrixtilde(M,v,mesh,mu,k1perm,gradsquare);
        dom(i1,i2).ktilde=ktilde;
%         dom(i1,i2).ktilde=ktilde*0+coeficient(Mpx,Mpy,mu,k1perm);
%        dom(i1,i2).Masstilde=Masstilde;
    end
end
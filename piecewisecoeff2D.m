function dom=piecewisecoeff2D(dom,Nx,Ny,mu,k1perm)


for i1=1:Nx
for i2=1:Ny
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        mesh=dom(i1,i2).mesh;
        coeff=piecewiselocal2D(M,v,mesh,mu,k1perm);
        dom(i1,i2).coeff=(coeff);
end
end
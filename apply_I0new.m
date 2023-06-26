function w=apply_I0new(u,dom,dom_ov,Nx,Ny,mu,k1perm)

z=u*0;

for i1=1:Nx-1
    for i2=1:Ny-1
 %       A=dom_ov(i1,i2).A;
        M=dom_ov(i1,i2).Mass;
        Ig=dom_ov(i1,i2).Ig;
        philin=dom_ov(i1,i2).philin;
        lu=u(Ig);
        Nbad=dom_ov(i1,i2).Nbad;
        zlocal=0*z;
        for l=1:Nbad
            psi=dom_ov(i1,i2).psibad(:,l);
            alpha=dot(psi(Ig),M*lu);
            zlocal=zlocal+alpha*psi;
        end
%               plot_vector(zlocal, dom,Nx,Ny,mu,k1perm);
%               hold off
            z=z+zlocal.*philin;
    end
end
w=z;
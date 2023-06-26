function w=apply_I0new(u,dom,dom_ov,Nx,Ny,mu)

z=u*0;

for i1=1:Nx-1
    for i2=1:Ny-1
        A=dom_ov(i1,i2).A;
        M=dom_ov(i1,i2).Mass;
        Ig=dom_ov(i1,i2).Ig;
        lu=u(Ig);
        Nbad=dom_ov(i1,i2).Nbad;
        for l=1:Nbad
            psi=dom_ov(i1,i2).psibad(:,l);
            alpha=dot(psi1(Ig),M*lu);
            z=z+alpha*phi;
        end
        %      plot_vector(z, dom,Nx,Ny,mu,[]);
        %      hold off
        %    z=z+alpha1*phi1;
    end
end
w=z;
function w=applay_sumStildeIinv1L(u,dom,dom_ov, A0,Nx,Ny)
w=sparse(size(u,1),size(u,2));
GT=interface_index(dom,Nx,Ny);

for i1=1:Nx-1
    for i2=1:Ny-1
      %DIu=applay_D_I(u,dom,i1,i2,Nx,Ny);
    wI=applay_Stilde_Iinv(u,dom_ov,i1,i2,Nx,Ny,GT);
%    plot_vector(wI, dom,Nx,Ny,1,[])
%    pause
     %DIwI=applay_D_I(wI,dom,i1,i2,Nx,Ny);
    w=w+wI;
    end
end


function w=applay_sumSIinv1L(u,dom,dom_ov, A0,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
      DIu=applay_D_I(u,dom,i1,i2,Nx,Ny);
    wI=applay_S_Iinv(DIu,dom,i1,i2,Nx,Ny);
%    plot_vector(wI, dom,Nx,Ny,1,[])
%    pause
     DIwI=applay_D_I(wI,dom,i1,i2,Nx,Ny);
    w=w+DIwI;
    end
end


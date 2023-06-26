function w=applay_sumSIinvEMF(u,dom,dom_ov, A0,Nx,Ny)
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

w0=apply_P0EMF(u,dom_ov,Nx,Ny,A0);
GT=interface_index(dom,Nx,Ny);
w0aux=w0*0;
w0aux(GT)=w0(GT);
w=w+w0aux;
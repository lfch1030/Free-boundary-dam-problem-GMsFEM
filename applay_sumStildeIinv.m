function w=applay_sumStildeIinv(u,dom,dom_ov, A0,Nx,Ny)
GT=interface_index(dom,Nx,Ny);
w=sparse(size(u,1),size(u,2));
for i1=1:Nx-1
    for i2=1:Ny-1
%    DIu=applay_D_I(u,dom,i1,i2,Nx,Ny);
    wI=applay_Stilde_Iinv(u,dom_ov,i1,i2,Nx,Ny,GT);
%    plot_vector(wI, dom,Nx,Ny,1,[])
%    pause
%    DIwI=applay_D_I(wI,dom,i1,i2,Nx,Ny);
    w=w+wI;
%          pause

    end
end

w0=apply_P0MS(u,dom_ov,Nx,Ny,A0);
%GT=interface_index(dom,Nx,Ny);
w0aux=w0*0;
w0aux(GT)=w0(GT);
w=w+w0aux;
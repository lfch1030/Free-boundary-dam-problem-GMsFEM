function w=applay_SN(u,dom,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    wI=applay_SN_I(u,dom,i1,i2,Nx,Ny);
    w=w+wI;
    end
end

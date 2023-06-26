function w=applay_AII_inv(u,dom,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    wI=applay_AII_inv_local(u,dom,i1,i2);
    w=w+wI;
    end
end

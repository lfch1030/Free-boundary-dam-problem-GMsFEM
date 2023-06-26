function w=applay_AIG(u,dom,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    wI=applay_AIG_local(u,dom,i1,i2);
    w=w+wI;
    end
end

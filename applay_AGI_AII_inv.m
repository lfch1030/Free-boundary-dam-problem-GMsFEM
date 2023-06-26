function w=applay_AGI_AII_inv(u,dom,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    wI=applay_AGI_AII_inver(u,dom,i1,i2);
    w=w+wI;
    end
end

GT=interface_index(dom,Nx,Ny);

w(GT)=w(GT)+u(GT);
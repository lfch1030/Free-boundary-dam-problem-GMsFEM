%[dom_ov3,nvel_ov3]=localsetting_ov(ax,bx,ay,by,Nx,Ny,nx,ny,nx,mu,k1perm);
dom=localeigenvectors(b,dom, Nx,Ny);

for i1=1:Nx-1
    for i2=1:Ny-1
        LK11(i1,i2)=dom(i1,i2).lambda(2);
    end
end
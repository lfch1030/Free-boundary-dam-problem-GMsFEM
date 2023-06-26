[dom_ov3,nvel_ov3]=localsetting_ov(ax,bx,ay,by,Nx,Ny,nx,ny,nx,mu,k1perm);
dom_ov3=localeigenvectors3x3(b,dom_ov3, Nx,Ny);

for i1=1:Nx;
    for i2=1:Ny
        LK33(i1,i2)=dom_ov3(i1,i2).lambda(2);
    end
end
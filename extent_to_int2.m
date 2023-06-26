function uI=extent_to_int2(u,dom,Nx,Ny)


w=applay_AIG(u,dom,Nx,Ny);

w=applay_AII_inv(w,dom,Nx,Ny);

%wb=applay_AII_inv(b,dom,Nx,Ny);

uI=-w;
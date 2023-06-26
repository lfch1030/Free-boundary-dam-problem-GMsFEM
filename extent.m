function uI=extent(u,b,dom,Nx,Ny)


w=applay_AIG(u,dom,Nx,Ny);

w=applay_AII_inv(w,dom,Nx,Ny);
wb=applay_AII_inv(b,dom,Nx,Ny);

uI=wb-w;
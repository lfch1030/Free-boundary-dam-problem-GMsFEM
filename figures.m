ntGI=applay_AGI(vones,dom,Nx,Ny);
ntGG=applay_AGG(vones,dom,Nx,Ny);
ntGIov=applay_AGI(vones,dom_ov,Nx-1,Ny-1);
nt=ntGIov-ntGI;

cs=countsubdomains(x,dom,Nx,Ny);
VT=vertex_index(dom,Nx,Ny);
cs(VT)=1;
figure(1)
plot_vector_interior(-nt/10,dom,Nx,Ny);
figure(2)
plot_vector_interior(rhstotal3,dom,Nx,Ny);
figure(3)
plot_vector_interior((nt/10)+rhstotal3,dom,Nx,Ny);

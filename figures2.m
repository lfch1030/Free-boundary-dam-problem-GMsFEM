subplot(1,2,1)
Nauxcolor=100;
Mcolormap= kron(  [1;1;1], (Nauxcolor:-1:Nauxcolor/3)/Nauxcolor)';
plot_coeff(dom,Nx,Ny,mu,k1perm/10-1); shading flat; view(2)
colormap(Mcolormap)
figure(1,2,2)
plot_vector(p,dom,Nx,Ny); view(2); shading interp
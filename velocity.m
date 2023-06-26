
 Pef=piecewisecoeff2Dgrad(xf,dom,Nx,Ny);
  vecf=PCtovector(Pef,dom,Nx,Ny);
 Min=min(log(vecf))-5;
 Max=max(log(vecf))+5;
my_clim = [Min Max];
figure(3)
subplot(2,2,1)
plot_piecewisecoeff2Dgrad(xf,dom,Nx,Ny); 
colormap(jet(1024)), caxis(my_clim)
title('f')
subplot(2,2,2)
plot_piecewisecoeff2Dgrad(z0EM,dom,Nx,Ny);
colormap(jet(1024)), caxis(my_clim)
title('EMF')
subplot(2,2,3)
plot_piecewisecoeff2Dgrad(z02C,dom,Nx,Ny);
colormap(jet(1024)), caxis(my_clim)
subplot(2,2,4)
plot_piecewisecoeff2Dgrad(z02CMS2,dom,Nx,Ny);
colormap(jet(1024)), caxis(my_clim)

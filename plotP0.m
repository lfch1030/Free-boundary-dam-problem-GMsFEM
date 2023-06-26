w0=apply_P0(b,dom_ov,Nx,Ny,A0);
w0MS=apply_P0MS(b,dom_ov,Nx,Ny,A0MS);
w0EMF=apply_P0EMF(b,dom_ov,Nx,Ny,A0EMF);
w0EMAM=apply_P0EMAM(b,dom_ov,Nx,Ny,A0EMAM);
xd0=apply_R0(xd,dom_ov,Nx,Ny);
xd0=apply_R0_T(xd0,dom_ov,Nx,Ny);
figure(1)
plot_vector(x1L, dom,Nx,Ny,mu,k1perm)
title('finescale sol')
% view(2); shading interp; axis square

figure(2)
subplot(2,2,1)
plot_vector(abs(w0-x1L), dom,Nx,Ny,mu,k1perm)
title('coarse piecewise linear')
% view(2); shading interp; axis square

subplot(2,2,2)
plot_vector(abs(w0MS-x1L), dom,Nx,Ny,mu,k1perm)
title('coarse linear multiscale')
% view(2); shading interp; axis square

subplot(2,2,3)
plot_vector(abs(w0EMF-x1L), dom,Nx,Ny,mu,k1perm)
title('coarse energy min. fun')
% view(2); shading interp; axis square

subplot(2,2,4)
plot_vector(abs(w0EMAM-x1L), dom,Nx,Ny,mu,k1perm)
title('coarse energy min. fun A+M')
% view(2); shading interp; axis square



figure(1)
subplot(2,2,1) 
%plot_vector(-z02L, dom,Nx,Ny,mu,k'); title(['LIN, E-ERR0R=',num2str(ee2L)]) ;view(2)
plot_vector(xf, dom,Nx,Ny,mu,k'); title(['Fine scale sol (',num2str(size(x2L,1)),')']) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,2) 
plot_vector(EMS, dom,Nx,Ny,mu,k'); title(['MS(',num2str(size(A0MS,1)),'), |e|_A=',num2str(eeMS),'   |e|_1=',num2str(ehMS)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,3) 
plot_vector(EEM, dom,Nx,Ny,mu,k'); title(['EMF(',num2str(size(A0EMF,1)),'), |e|_A=',num2str(eeEM),'  |e|_1=',num2str(ehEM)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,4) 
plot_vector(E2C, dom,Nx,Ny,mu,k'); title(['LSM_1(',num2str(size(A02C,1)),'), |e|_A=',num2str(ee2C),'   |e|_1=',num2str(eh2C)]) ;view(2)
shading flat; colorbar; axis square



figure(2)
subplot(2,2,1) 
%plot_vector(-z02L, dom,Nx,Ny,mu,k'); title(['LIN, E-ERR0R=',num2str(ee2L)]) ;view(2)
plot_vector(x2L+xd, dom,Nx,Ny,mu,k'); title(['Fine scale sol (',num2str(size(x2L,1)),')']) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,2) 
plot_vector(E2C, dom,Nx,Ny,mu,k'); title(['LSM_1(',num2str(size(A02C,1)),'), |e|_A=',num2str(ee2C),'   |e|_1=',num2str(eh2C)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,3) 
plot_vector(E2CMS2, dom,Nx,Ny,mu,k'); title(['LSM-RE(',num2str(size(A02CMS2,1)),'), |e|_A=',num2str(ee2CMS2),'   |e|_1=',num2str(eh2CMS2)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,4) 
plot_vector(ER, dom,Nx,Ny,mu,k'); title(['RLSM(',num2str(size(A02Cr,1)),'), |e|_A=',num2str(eeR),'   |e|_1=',num2str(ehR)]) ;view(2)
shading flat; colorbar; axis square



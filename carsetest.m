%exp1coarse

Ax2C= applay_A(x2L,dom,Nx,Ny);
Ex=full(dot(x2L,Ax2C));
pEx=x2C.*Ax2C;


z02L=apply_P0Bd(b,dom_ov,Nx,Ny,A0,dir,vC,L1);
E2L=z02L-x2L;
AE2L= applay_A(E2L,dom,Nx,Ny);
ee2L=full(dot(E2L,AE2L))/Ex;



z0MS=apply_P0MSBd(b,dom_ov,Nx,Ny,A0MS,dir,vC);
EMS=z0MS-x2L;
AEMS= applay_A(EMS,dom,Nx,Ny);
eeMS=full(dot(EMS,AEMS))/Ex;


z0EM=apply_P0EMFBd(b,dom_ov,Nx,Ny,A0EMF,dir,vC);
EEM=z0EM-x2L;
AEEM= applay_A(EEM,dom,Nx,Ny);
eeEM=full(dot(EEM,AEEM))/Ex;

z02C=apply_P0BADBd(b,dom_ov,Nx,Ny,A02C,d02C,d02Cn,v02C,P1);
E2C=z02C-x2L;
AE2C= applay_A(E2C,dom,Nx,Ny);
ee2C=full(dot(E2C,AE2C))/Ex;


% % % % z02CMS2=apply_P0BADMS2(b,dom_ov,Nx,Ny,A02CMS2);
% % % % E2CMS2=z02CMS2-x2C;
% % % % AE2CMS2= applay_A(E2CMS2,dom,Nx,Ny);
% % % % ee2CMS2=full(dot(E2CMS2,AE2CMS2))/Ex;
% % % % 
% % % % 
% % % % z0R=apply_P0BADMSr(b,dom_ov,Nx,Ny,A02Cr);
% % % % ER=z0R-x2C;
% % % % AER= applay_A(ER,dom,Nx,Ny);
% % % % eeR=full(dot(ER,AER))/Ex;
% % % % 
% % % % 

figure(1)
subplot(2,2,1) 
%plot_vector(-z02L, dom,Nx,Ny,mu,k'); title(['LIN, E-ERR0R=',num2str(ee2L)]) ;view(2)
plot_vector(x2L, dom,Nx,Ny,mu,k'); title('Fine scale sol') ;view(2)
subplot(2,2,2) 
plot_vector(z0MS, dom,Nx,Ny,mu,k'); title(['MS, E-ERR0R=',num2str(eeMS)]) ;view(2)
subplot(2,2,3) 
plot_vector(z0EM, dom,Nx,Ny,mu,k'); title(['EMF, E-ERR0R=',num2str(eeEM)]) ;view(2)
subplot(2,2,4) 
plot_vector(z02C, dom,Nx,Ny,mu,k'); title(['2C, E-ERR0R=',num2str(ee2C)]) ;view(2)



% % % figure(2)
% % % subplot(2,2,1) 
% % % %plot_vector(-z02L, dom,Nx,Ny,mu,k'); title(['LIN, E-ERR0R=',num2str(ee2L)]) ;view(2)
% % % plot_vector(-x2C, dom,Nx,Ny,mu,k'); title('Fine scale sol') ;view(2)
% % % subplot(2,2,2) 
% % % plot_vector(-z02C, dom,Nx,Ny,mu,k'); title(['2C, E-ERR0R=',num2str(ee2C)]) ;view(2)
% % % subplot(2,2,3) 
% % % plot_vector(-z02CMS2, dom,Nx,Ny,mu,k'); title(['2CMS, E-ERR0R=',num2str(ee2CMS2)]) ;view(2)
% % % subplot(2,2,4) 
% % % plot_vector(-z0R, dom,Nx,Ny,mu,k'); title(['Reduced, E-ERR0R=',num2str(eeR)]) ;view(2)
% % % 
% % % 
% save perm2NnewBcaorse8x102.mat
 
%  %perm3caorse.mat
%   perm2forplot.mat 
%  perm3NBcaorse8x10.mat
%  permreadperm.mat
%  perm2caorse.mat 
%   perm2NBcaorse8x10.mat
%exp1

xf=x2L+xd;
Axf= applay_AN(xf,dom,Nx,Ny);
Mxf=applay_M(xf,dom,Nx,Ny);
Exf=full(dot(xf,Axf));
Hxf=norm_h1_global(xf,dom,Nx,Ny);
L2xf=norm_l2_global(xf,dom,Nx,Ny);
Mxf=full(dot(xf,Mxf));
L2vf=norm_velocityL2_global(xf,dom,Nx,Ny,mu,k1perm);
%pEx=(x2L+xd).*Axf;
%Ex=1;

% % z02L=apply_P0Bd(b,dom_ov,Nx,Ny,A0,d0,v0);
% % E2L=z02L-x2L-xd;
% % AE2L= applay_AN(E2L,dom,Nx,Ny);
% % ee2L=full(dot(E2L,AE2L))/Ex;



z0MS=apply_P0MSBd(b,dom_ov,Nx,Ny,A0MS,d0MS,v0MS);
EMS=z0MS-xf;
AEMS= applay_AN(EMS,dom,Nx,Ny);
MEMS= applay_M(EMS,dom,Nx,Ny);
eeMS=full(dot(EMS,AEMS))/Exf;
eMMS=full(dot(EMS,MEMS))/Mxf;
ehMS=norm_h1_global(EMS,dom,Nx,Ny)/Hxf;
el2MS=norm_l2_global(EMS,dom,Nx,Ny)/L2xf;
eL2vMS=norm_velocityL2_global(EMS,dom,Nx,Ny,mu,k1perm)/L2vf;

z0EM=apply_P0EMFBd(b,dom_ov,Nx,Ny,A0EMF,d0EMF,v0EMF);
EEM=z0EM-xf;
AEEM= applay_AN(EEM,dom,Nx,Ny);
MEEM= applay_M(EEM,dom,Nx,Ny);
eeEM=full(dot(EEM,AEEM))/Exf;
eMEM=full(dot(EEM,MEEM))/Mxf;
ehEM=norm_h1_global(EEM,dom,Nx,Ny)/Hxf;
el2EM=norm_l2_global(EEM,dom,Nx,Ny)/L2xf;
eL2vEM=norm_velocityL2_global(EEM,dom,Nx,Ny,mu,k1perm)/L2vf;

z02C=apply_P0BADBd2(b,dom_ov,Nx,Ny,A02C,d02C,d02Cn,v02C,P1);
E2C=z02C-xf;
AE2C= applay_AN(E2C,dom,Nx,Ny);
ME2C= applay_M(E2C,dom,Nx,Ny);
ee2C=full(dot(E2C,AE2C))/Exf;
eM2C=full(dot(E2C,ME2C))/Mxf;
eh2C=norm_h1_global(E2C,dom,Nx,Ny)/Hxf;
el22C=norm_l2_global(E2C,dom,Nx,Ny)/L2xf;
eL2v2C=norm_velocityL2_global(E2C,dom,Nx,Ny,mu,k1perm)/L2vf;


z02CMS=apply_P0BADMSBd(b,dom_ov,Nx,Ny,A02CMS2,d02CMS,d02CMSn,v02CMS,P1MS);
E2CMS=z02CMS-xf;
AE2CMS= applay_AN(E2CMS,dom,Nx,Ny);
ME2CMS= applay_M(E2CMS,dom,Nx,Ny);
ee2CMS=full(dot(E2CMS,AE2CMS))/Exf;
eM2CMS=full(dot(E2CMS,ME2CMS))/Mxf;
eh2CMS=norm_h1_global(E2CMS,dom,Nx,Ny)/Hxf;
el22CMS=norm_l2_global(E2CMS,dom,Nx,Ny)/L2xf;
eL2v2CMS=norm_velocityL2_global(E2CMS,dom,Nx,Ny,mu,k1perm)/L2vf;




z02CMS2=apply_P0BADMS2Bd(b,dom_ov,Nx,Ny,A02CMS2,d02CMS,d02CMSn,v02CMS,P1MS);
E2CMS2=z02CMS2-xf;
AE2CMS2= applay_AN(E2CMS2,dom,Nx,Ny);
ME2CMS2= applay_M(E2CMS2,dom,Nx,Ny);
ee2CMS2=full(dot(E2CMS2,AE2CMS2))/Exf;
eM2CMS2=full(dot(E2CMS2,ME2CMS2))/Mxf;
eh2CMS2=norm_h1_global(E2CMS2,dom,Nx,Ny)/Hxf;
el22CMS2=norm_l2_global(E2CMS2,dom,Nx,Ny)/L2xf;
eL2v2CMS2=norm_velocityL2_global(E2CMS2,dom,Nx,Ny,mu,k1perm)/L2vf;


z0R=apply_P0BADMSrBd(b,dom_ov,Nx,Ny,A02Cr,d02Cr,d02Crn,v02Cr,P1r);
ER=z0R-xf;
AER= applay_AN(ER,dom,Nx,Ny);
MER= applay_M(ER,dom,Nx,Ny);
eeR=full(dot(ER,AER))/Exf;
eMR=full(dot(ER,MER))/Mxf;
ehR=norm_h1_global(ER,dom,Nx,Ny)/Hxf;
el2R=norm_l2_global(ER,dom,Nx,Ny)/L2xf;
eL2vR=norm_velocityL2_global(ER,dom,Nx,Ny,mu,k1perm)/L2vf;




figure(1)
subplot(2,2,1) 
%plot_vector(-z02L, dom,Nx,Ny,mu,k'); title(['LIN, E-ERR0R=',num2str(ee2L)]) ;view(2)
plot_vector(xf, dom,Nx,Ny,mu,k'); title(['Fine scale sol (',num2str(size(x2L,1)),')']) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,2) 
plot_vector(z0MS, dom,Nx,Ny,mu,k'); title(['MS(',num2str(size(A0MS,1)),'), |e|_A=',num2str(eeMS),'   |e|_1=',num2str(ehMS)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,3) 
plot_vector(z0EM, dom,Nx,Ny,mu,k'); title(['EMF(',num2str(size(A0EMF,1)),'), |e|_A=',num2str(eeEM),'  |e|_1=',num2str(ehEM)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,4) 
plot_vector(z02C, dom,Nx,Ny,mu,k'); title(['LSM_1(',num2str(size(A02C,1)),'), |e|_A=',num2str(ee2C),'   |e|_1=',num2str(eh2C)]) ;view(2)
shading flat; colorbar; axis square



figure(2)
subplot(2,2,1) 
%plot_vector(-z02L, dom,Nx,Ny,mu,k'); title(['LIN, E-ERR0R=',num2str(ee2L)]) ;view(2)
plot_vector(x2L+xd, dom,Nx,Ny,mu,k'); title(['Fine scale sol (',num2str(size(x2L,1)),')']) ;view(2)
%plot_vector(z02C, dom,Nx,Ny,mu,k'); title(['LSM_1(',num2str(size(A02C,1)),'), |e|_A=',num2str(ee2C),'   |e|_1=',num2str(eh2C)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,2) 
plot_vector(z02CMS, dom,Nx,Ny,mu,k'); title(['LSM_2(',num2str(size(A02CMS,1)),'), |e|_A=',num2str(ee2CMS),'   |e|_1=',num2str(eh2CMS)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,3) 
plot_vector(z02CMS2, dom,Nx,Ny,mu,k'); title(['LSM-RE(',num2str(size(A02CMS2,1)),'), |e|_A=',num2str(ee2CMS2),'   |e|_1=',num2str(eh2CMS2)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,4) 
plot_vector(z0R, dom,Nx,Ny,mu,k'); title(['RLSM(',num2str(size(A02Cr,1)),'), |e|_A=',num2str(eeR),'   |e|_1=',num2str(ehR)]) ;view(2)
shading flat; colorbar; axis square


EnergyE=[eeMS, eeEM, ee2C,ee2CMS, ee2CMS2, eeR];
L2weigE=[eMMS, eMEM, eM2C, eM2CMS,eM2CMS2, eMR];
H1E=[ehMS, ehEM, eh2C, eh2CMS , eh2CMS2, ehR];
L2E=[el2MS, el2EM, el22C, eh2CMS, el22CMS2, el2R];
L2V=[eL2vMS,eL2vEM,eL2v2C, eh2CMS, eL2v2CMS2, eL2vR];


% % % 
% save perm2NnewBcaorse8x102.mat
 
%  %perm3caorse.mat
%   perm2forplot.mat 
%  perm3NBcaorse8x10.mat
%  permreadperm.mat
%  perm2caorse.mat 
%   perm2NBcaorse8x10.mat
function [dom,dom_ov,b,xd, A0,A0MS, A0EMF,A02C,A02CMS,A02CMS2,A02Cr,iterlambdaEMF,A02Ctilde,A02CtildeEM]=maintwoDB(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol,ov)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function

%ov=5;


[dom_ov,nvel_ov]=localsetting_ov2(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);
[dom,b,nvel]=localsetting(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);
%[dom_ovdelta,nvel_ov2]=localsetting_ov(ax,bx,ay,by,Nx,Ny,nx,ny,ov,mu,k1perm);
%bnew=applay_Aadd_inv2(b,dom_ov,Nx,Ny);

w=createlinear(b,dom,Nx,Ny);
%w=w*0;
xd=w-zerodir(w,dom,Nx,Ny);

Axd=applay_AN(xd,dom,Nx,Ny);
Axd=zerodir(Axd,dom,Nx,Ny);
b=b-Axd;

%dom=piecewisecoeff2D(dom,Nx,Ny,mu);
%vones=createone(b,dom,Nx,Ny);
fprintf('Local eigenvectors... ');
dom_ov=localeigenvectorsDB(b,dom_ov, Nx,Ny);
fprintf('Done\n');

dom_ov=linearones(dom,dom_ov,Nx,Ny,b);
dom_ov=linearonesDB(dom,dom_ov,Nx,Ny,b);
dom_ov=linearones2(dom,dom_ov,Nx,Ny,b);

dom_ov=linearmsDB(dom,dom_ov,Nx,Ny,b);
%dom_ov=linearms(dom,dom_ov,Nx,Ny,b);
fprintf('Energy minimizing ....');
[dom_ov,iterlambdaEMF]=emf(dom,dom_ov,Nx,Ny,b,mu,k1perm);
fprintf('Done\n');

fprintf('Mass matrix tilde.... ');
dom_ov=Mtilde_ov(dom,dom_ov,Nx,Ny,mu,k1perm);
dom_ov=Mtilde_ovEM(dom,dom_ov,Nx,Ny,mu,k1perm);
fprintf('Done\n');



fprintf('Local eigenvectors with Mtilde... ');
dom_ov=localeigenvectorsDBtilde(b,dom_ov, Nx,Ny);
dom_ov=localeigenvectorsDBtildeEM(b,dom_ov, Nx,Ny);
fprintf('Done\n');

%[dom_ov,iterlambdaEMAM]=emfAM(dom,dom_ov,Nx,Ny,b);
fprintf('Basis functions .... ');
dom_ov=emfpuK22DB(dom,dom_ov,Nx,Ny,b,mu);
dom_ov=emfpuK22MS(dom,dom_ov,Nx,Ny,b,mu);
dom_ov=emfBADms(dom,dom_ov,Nx,Ny,b);
dom_ov=emfBADmsreduced(dom,dom_ov,Nx,Ny,b);
dom_ov=emfpuK22DBtilde(dom,dom_ov,Nx,Ny,b,mu);
dom_ov=emfpuK22DBtildeEM(dom,dom_ov,Nx,Ny,b,mu);
fprintf('Done\n');


fprintf('Coarse matrices: ');
A0=coarse_matrix(dom,dom_ov,Nx,Ny);
fprintf('Linear, ');
A0MS=coarse_matrix_MS(dom,dom_ov,Nx,Ny);
fprintf('MS, ');
A0EMF=coarse_matrix_EMF(dom,dom_ov,Nx,Ny);
fprintf('EMF, ');
%A0EMAM=coarse_matrix_EMAM(dom,dom_ov,Nx,Ny);
A02C=coarse_matrixBAD(dom,dom_ov,Nx,Ny);
fprintf('LSM1, ');
A02CMS=coarse_matrixBADMS(dom,dom_ov,Nx,Ny);
fprintf('LSM2, ');
A02CMS2=coarse_matrixBADMStwo(dom,dom_ov,Nx,Ny);
fprintf('LSM-RE, ');
A02Cr=coarse_matrixBADMSr(dom,dom_ov,Nx,Ny);
fprintf('Reduced-LSM, ');
A02Ctilde=coarse_matrixBADtilde(dom,dom_ov,Nx,Ny);
fprintf('LSMtilde, ');
A02CtildeEM=coarse_matrixBADtildeEM(dom,dom_ov,Nx,Ny);
fprintf('LSMtildeEM, ');

fprintf('Done\n');


%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, max_it, tol,dom,Nx,Ny);
%bdaux=datadirnew(0*b,dom,Nx,Ny);
%bd=b*0-applay_AN(bdaux,dom,Nx,Ny);
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0,b,b, max_it, tol,dom,dom_ov,Nx,Ny);


%[x2, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%xp=x2;
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0, x,b, max_it, tol,dom,dom_ov,Nx,Ny);

%plot_vector(b,dom,Nx,Ny)
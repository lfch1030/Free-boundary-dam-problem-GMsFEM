function [dom,dom_ov,b,xd, A0,A0MS, A0EMF,A02C,A02CMS,A02CMS2,iterlambdaEMF]=maintwo(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function

%ov=5;


[dom_ov,nvel_ov]=localsetting_ov2(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);
[dom,b,nvel]=localsetting(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);
bnew=applay_Aadd_inv2(b,dom_ov,Nx,Ny);

w=createlinear(b,dom,Nx,Ny);
%w=w*0;
xd=w-zerodir(w,dom,Nx,Ny);

Axd=applay_AN(xd,dom,Nx,Ny);
Axd=zerodir(Axd,dom,Nx,Ny);
b=b-0*Axd;

%dom=piecewisecoeff2D(dom,Nx,Ny,mu);
%vones=createone(b,dom,Nx,Ny);
dom_ov=localeigenvectors(b,dom_ov, Nx,Ny);

dom_ov=linearones(dom,dom_ov,Nx,Ny,b);
dom_ov=linearones2(dom,dom_ov,Nx,Ny,b);

dom_ov=linearms(dom,dom_ov,Nx,Ny,b);
%dom_ov=linearms(dom,dom_ov,Nx,Ny,b);

[dom_ov,iterlambdaEMF]=emfB(dom,dom_ov,Nx,Ny,b,mu,k1perm);
%[dom_ov,iterlambdaEMAM]=emfAM(dom,dom_ov,Nx,Ny,b);
dom_ov=emfpuK22B(dom,dom_ov,Nx,Ny,b,mu);
dom_ov=emfpuK22MSB(dom,dom_ov,Nx,Ny,b,mu);
dom_ov=emfBADmsB(dom,dom_ov,Nx,Ny,b);
dom_ov=emfBADmsreducedB(dom,dom_ov,Nx,Ny,b);

A0=coarse_matrix(dom,dom_ov,Nx,Ny);
A0MS=coarse_matrix_MS(dom,dom_ov,Nx,Ny);
A0EMF=coarse_matrix_EMF(dom,dom_ov,Nx,Ny);
%A0EMAM=coarse_matrix_EMAM(dom,dom_ov,Nx,Ny);
A02C=coarse_matrixBAD(dom,dom_ov,Nx,Ny);
A02CMS=coarse_matrixBADMS(dom,dom_ov,Nx,Ny);
A02CMS2=coarse_matrixBADMStwo(dom,dom_ov,Nx,Ny);
A02Cr=coarse_matrixBADMSrB(dom,dom_ov,Nx,Ny);


%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, max_it, tol,dom,Nx,Ny);
%bdaux=datadirnew(0*b,dom,Nx,Ny);
%bd=b*0-applay_AN(bdaux,dom,Nx,Ny);
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0,b,b, max_it, tol,dom,dom_ov,Nx,Ny);


%[x2, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%xp=x2;
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0, x,b, max_it, tol,dom,dom_ov,Nx,Ny);

%plot_vector(b,dom,Nx,Ny)
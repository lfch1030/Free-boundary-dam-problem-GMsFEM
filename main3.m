
function [dom,dom_ov,b,bnew, xd,A0MS, A0EMF]=main3(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function

%ax=0;bx=1;ay=0;by=1;Nx=5; Ny=Nx;nx=5;ny=nx;\mu=999;%ov=4;%read_perm_juan%k1perm=k1; max_it=1000;tol=0.000001;

[dom_ov,nvel_ov]=localsetting_ov2(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);
[dom,b,nvel]=localsetting(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);

dom_ov=linearones(dom,dom_ov,Nx,Ny,b);
dom_ov=linearms(dom,dom_ov,Nx,Ny,b);
A0MS=coarse_matrix_MS(dom,dom_ov,Nx,Ny);

[dom_ov,iterlambdaEMF]=emf(dom,dom_ov,Nx,Ny,b,mu,k1perm);
A0EMF=coarse_matrix_EMF(dom,dom_ov,Nx,Ny);


bnew=applay_Aadd_inv2(b,dom_ov,Nx,Ny);
w=createlinear(b,dom,Nx,Ny);
xd=w-zerodir(w,dom,Nx,Ny);
Axd=applay_AN(xd,dom,Nx,Ny);
Axd=zerodir(Axd,dom,Nx,Ny);
b=b-Axd;



vones=createone(b,dom,Nx,Ny);


bnew=applay_AGI_AII_inv(b,dom,Nx,Ny);

[cf,dom]=counting(b,dom,Nx,Ny,mu,k1perm);
dom=countingBasis(b,dom,cf,Nx,Ny,mu);



%[x, error, iter, flag, lambdamax, condnumber] = Scg(b*0, bnew,bnew, max_it, tol,dom,Nx,Ny);
%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, max_it, tol,dom,Nx,Ny);
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%[x, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%xp=x;
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0, x,b, max_it, tol,dom,dom_ov,Nx,Ny);
%plot_vector(b,dom,Nx,Ny)

GT=interface_index(dom,Nx,Ny);
VT=vertex_index(dom,Nx,Ny);
wdelta=vones;
wdelta(GT)=wdelta(GT)/2;
wdelta(VT)=wdelta(VT)/2;



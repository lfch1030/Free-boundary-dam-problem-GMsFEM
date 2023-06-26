for n=8
    for N=1
exponent=n;
mu=10^(exponent-1)-1;
%read_perm_juan
perm_gen3
k1perm=k;
% perm_gen2
% k1perm=k';
max_it=2000;
%tol=0.000000001;
tol=1e-10;
ax=0;bx=1;ay=0;by=1;
Nx=8; Ny=Nx;
nx=10;ny=nx;

[dom,dom_ov,b,xd, A0,A0MS, A0EMF,A02C,A02CMS,A02CMS2,A02Cr]=maintwo(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol);
%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, 2*max_it, tol,dom,Nx,Ny);
%sol=3*dom_ov(2,2).philin+dom_ov(4,4).phiEM;
%b=applay_A(sol,dom,Nx,Ny);

%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, max_it, 2*tol,dom,Nx,Ny,mu);
%[x1L, error1L, iter1L, flag1L, lambdamax1L, condnumber1L] = Apcg(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu);
%[x2L, error2L, iter2L, flag2L, lambdamax2L, condnumber2L] = Apcg_ADD_2L(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0);
%[xMS, errorMS, iterMS, flagMS, lambdamaxMS, condnumberMS] = Apcg_ADD_2LMS(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0MS);
%[xEM, errorEM, iterEM, flagEM, lambdamaxEM, condnumberEM] = Apcg_ADD_2LEMF(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMF);
%[xAM, errorAM, iterAM, flagAM, lambdamaxAM, condnumberAM] = Apcg_ADD_2LEMAM(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMAM);
[x2C, error2C, iter2C, flag2C, lambdamax2C, condnumber2C] = Apcg_ADD_2LtwoC(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02C);
[x2CMS, error2CMS, iter2CMS, flag2CMS, lambdamax2CMS, condnumber2CMS] = Apcg_ADD_2LtwoCMS(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02CMS);
[x2CMS2, error2CMS2, iter2CMS2, flag2CMS2, lambdamax2CMS2, condnumber2CMS2] = Apcg_ADD_2LtwoCMS2(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02CMS2);
[xR, errorR, iterR, flagR, lambdamaxR, condnumberR] = Apcg_ADD_2LtwoCMSr(0*b, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02Cr);

%save solutions.mat xMS x2L xEM x2C

%[iter,iter1L, iter2L, iterEMF]
%iterlambdaEMF
%Siter(exponent,:)=[mu, iter1L, iter2L,iterMS,  iterEM,iter2C,iter2CMS,iter2CMS2,iterR]
% Siter(n,N)=iter2L;

%Scond(exponent,:)=[condnumber1L,condnumber2L,condnumberMS,condnumberEM,condnumber2C, condnumber2CMS,condnumber2CMS2,condnumberR ];
%Scond(n,N)=condnumber2L;
%Slmax(exponent,:)=[lambdamax1L,lambdamax2L, lambdamaxMS];
dom=piecewisecoeff2D(dom,Nx,Ny,mu,k1perm)
%tb.iter=Siter;
% tb.lambmax=Slmax;
% tb.cond=Scond;
 tb.dom=dom;
% tb.iterlambdaEMF=iterlambdaEMF;

tb.Nx=Nx,
tb.Ny=Ny;
% IN resultnew3.mat is the result with the new 
% perm of exp1.

save resultperm2.mat tb dom
%save resultnew5.mat tb dom
%save resultnew6.mat tb dom

%save Inclusions.mat tb 


badeig
lambdaL(n)=min(min(nexttobad));
Constant(n)=Nx^2/lambdaL(n);    
    
    end
end
% 
% for n=1:4
%     for N=1:4
%         fprintf('%d (%.2f) &   ', Siter(n,N),Scond(n,N))
%         
%     end
%             fprintf('\n  ', Iter(n,N),Cond(n,N))
% 
% end
% 
% %end 
% 

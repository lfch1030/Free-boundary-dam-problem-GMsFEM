for exponent=8
mu=10^(exponent-1)-1;
read_perm_juan
k1perm=k1;
max_it=2000;
tol=0.000001;
ax=0;bx=1;ay=0;by=1;
Nx=3; Ny=Nx;
nx=5;ny=nx;
[dom,dom_ov,b,bnew,xd,A0MS,A0EMF]=main3(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol);

%[x, error, iter, flag, lambdamax, condnumber] = Scg(b*0, bnew,bnew, max_it, tol,dom,Nx,Ny);
%[x1L, error1L, iter1L, flag1L, lambdamax1L, condnumber1L] = Apcg(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu);
%[x2L, error2L, iter2L, flag2L, lambdamax2L, condnumber2L] = Apcg_ADD_2L(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0);
[x1L, error1L, iter1L, flag1L, lambdamax1L, condnumber1L] =Spcg1L(b*0, bnew,bnew, max_it, tol,dom,dom_ov,A0MS,Nx,Ny);
[xMS, errorMS, iterMS, flagMS, lambdamaxMS, condnumberMS] =Spcg(b*0, bnew,bnew, max_it, tol,dom,dom_ov,A0MS,Nx,Ny);
[xEM, errorEM, iterEM, flagEM, lambdamaxEM, condnumberEM] =SpcgEMF(b*0, bnew,bnew, max_it, tol,dom,dom_ov,A0EMF,Nx,Ny);
%[xMS, errorMS, iterMS, flagMS, lambdamaxMS, condnumberMS] = Apcg_ADD_2LMS(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0MS);
%[xEM, errorEM, iterEM, flagEM, lambdamaxEM, condnumberEM] = Apcg_ADD_2LEMF(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMF);
%[xAM, errorAM, iterAM, flagAM, lambdamaxAM, condnumberAM] = Apcg_ADD_2LEMAM(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMAM);
%clc

%[iter,iter1L, iter2L, iterEMF]
Siter(exponent,:)=[mu+1, iter1L, iterMS,iterEM]

%figure(exponent)
%imagesc(k1perm')


Scond(exponent,:)=[ condnumber1L, condnumberMS,condnumberEM ];
Slmax(exponent,:)=[ condnumber1L, lambdamaxMS,lambdamaxEM ];

tb.iter=Siter;
tb.lambmax=Slmax;
tb.cond=Scond;
%tb.iterlambdaEMF=iterlambdaEMF;

%save resultnewOSCFEB20.mat tb 
%save ReadPermJuanResults.mat tb 
save SchurChanelResult.mat tb 
%save SchurNonOverReadPermJuan.mat tb 

end 

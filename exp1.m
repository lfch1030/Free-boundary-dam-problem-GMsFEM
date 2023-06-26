for n=[1]
    for N=1
exponent=n;
mu=10^((exponent-1))-1;
%read_perm_juan
newperm2
% newperm2_2msdg
 k1perm=k';
% perm_gen2
% k1perm=k';
max_it=2000;
%tol=0.000000001;
tol=1e-8;
ax=0;bx=1;ay=0;by=1;
Nx=5; Ny=Nx;
nx=7; ny=nx;
% for add=[0,1,2,3,4,5]
for add=[0]
%maintwoB
[dom,dom_ov,b,bnew,xd]=maintwoB(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol,add);

[A0,d0,v0]=coarse_matrix(dom,dom_ov,Nx,Ny);
[A0MS,d0MS,v0MS]=coarse_matrix_MS(dom,dom_ov,Nx,Ny);
[A0EMF,d0EMF,v0EMF]=coarse_matrix_EMF(dom,dom_ov,Nx,Ny);
%A0EMAM=coarse_matrix_EMAM(dom,dom_ov,Nx,Ny);
[A02C,d02C,d02Cn,v02C,P1]=coarse_matrixBAD(dom,dom_ov,Nx,Ny);
%[A02CMS,d02CMS,d02CMSn,v02CMS,P1MS]=coarse_matrixBADMS(dom,dom_ov,Nx,Ny);
%[A02CMS2,d02CMS2,d02CMS2n,v02CMS2,P1MS2]=coarse_matrixBADMStwo(dom,dom_ov,Nx,Ny);
%[A02Cr,d02Cr,d02Crn,v02Cr,P1r]=coarse_matrixBADMSrB(dom,dom_ov,Nx,Ny);

% fprintf('Reduced-LSM, ');
% [A02Ctilde,dir2Ctilde,dirn2Ctilde,vC2Ctilde,P12Ctilde]=coarse_matrixBADtilde(dom,dom_ov,Nx,Ny);
% fprintf('LSMtilde, ');
% A02CtildeEM=coarse_matrixBADtildeEM(dom,dom_ov,Nx,Ny);
% fprintf('LSMtildeEM, ');

%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, 2*max_it, tol,dom,Nx,Ny);
%sol=3*dom_ov(2,2).philin+dom_ov(4,4).phiEM;
%b=applay_A(sol,dom,Nx,Ny);

%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, max_it, 2*tol,dom,Nx,Ny,mu);
% [x1L, error1L, iter1L, flag1L, lambdamax1L, condnumber1L] = Apcg(b*0, bnew,bnew, max_it, tol,dom,dom_ov,Nx,Ny,mu);


xdir=b*0;

% for i=1:Nx
%     for j=Ny
%         xdir( dom(i,j).Ig(dom(i,j).B.vup)  )=1;
%     end
% end


for i=1
    for j=1:3
        xdir( dom(i,j).Ig(dom(i,j).B.vleft)  )=2;
    end
end


for i=Nx
    for j=1:2
        xdir( dom(i,j).Ig(dom(i,j).B.vright)  )=2;
    end
end
 

deltat=0.01;

% bnew=b-applay_AN(xdir,dom,Nx,Ny);

%%
theta=xdir;
beta=b*0;
alpha=b*0;
%%
for itime=1:500

[wx, wy]=xandy(b,dom,Nx,Ny);
kappa=coeficient(wx,wy,mu,k1perm)';
gravity=10;
nv=(Nx*nx+1)*(Ny*ny+1);
    
w=argtranslationup(theta.*kappa,nv,nx*Nx,ny*Ny,gravity, deltat);


    
for fpit=1:40
bnew=b-applay_AN(xdir,dom,Nx,Ny)-(0.5/deltat)*applay_M(xdir,dom,Nx,Ny)-0.5*apply_O1(xdir,dom,Nx,Ny);

bnew=bnew-apply_O1(beta,dom,Nx,Ny)-apply_O2(alpha,dom,Nx,Ny)-(1/deltat)*applay_M(beta,dom,Nx,Ny)+(1/deltat)*applay_M1(w,dom,Nx,Ny);

[x2L, error2L, iter2L, flag2L, lambdamax2L, condnumber2L] = Apcg_ADDdam(b*0, bnew,bnew, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0,d0,deltat);


p=x2L+xdir;
betaaux=p+beta;
betanew= - betaaux.*(betaaux<0)+betaaux.*(betaaux>=0).*(betaaux<=1) +(2-betaaux).*(betaaux>1);
nbeta=norm(betanew-beta)
beta=betanew;

alphaaux=p+alpha;
alphanew=-abs(alphaaux);

nalpha=norm(alphanew-alpha)
alpha=alphanew;



end
%theta=beta -  beta.*(beta<0)+beta.*(beta>=0).*(beta<=1) +(2-.5*beta).*(beta>1);
theta=beta+0.5*p;
plot_vector(theta,dom,Nx,Ny)
hold off
view(2)
 pause(0.1)

end
% [xMS, errorMS, iterMS, flagMS, lambdamaxMS, condnumberMS] = Apcg_ADD_2LMS(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0MS);
% [xEM, errorEM, iterEM, flagEM, lambdamaxEM, condnumberEM] = Apcg_ADD_2LEMF(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMF);
%[xAM, errorAM, iterAM, flagAM, lambdamaxAM, condnumberAM] = Apcg_ADD_2LEMAM(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMAM);
% [x2C, error2C, iter2C, flag2C, lambdamax2C, condnumber2C] = Apcg_ADD_2LtwoC(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02C);
% [x2CMS, error2CMS, iter2CMS, flag2CMS, lambdamax2CMS, condnumber2CMS] = Apcg_ADD_2LtwoCMS(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02CMS);
% [x2CMS2, error2CMS2, iter2CMS2, flag2CMS2, lambdamax2CMS2, condnumber2CMS2] = Apcg_ADD_2LtwoCMS2(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02CMS2);

%save solutions.mat xMS x2L xEM x2C

%[iter,iter1L, iter2L, iterEMF]
%iterlambdaEMF
% % % Siter(exponent,:)=[mu, iter1L, iter2L,iterMS,  iterEM,iter2C,iter2CMS,iter2CMS2]
% % % % Siter(n,N)=iter2L;
% % % 
% % % Scond(exponent,:)=[condnumber1L,condnumber2L,condnumberMS,condnumberEM,condnumber2C, condnumber2CMS,condnumber2CMS2 ];
% % % %Scond(n,N)=condnumber2L;
% % % %Slmax(exponent,:)=[lambdamax1L,lambdamax2L, lambdamaxMS];
% % % %dom=piecewisecoeff2D(dom,Nx,Ny,mu,[])
% % % tb.iter=Siter;
% % % % tb.lambmax=Slmax;
% % %  tb.cond=Scond;
% % %  tb.dom=dom;
% % % % tb.iterlambdaEMF=iterlambdaEMF;
% % % 
% % % tb.Nx=Nx,
% % % tb.Ny=Ny;
% % % % IN resultnew3.mat is the result with the new 
% % % % perm of exp1.
% % % 
% % % save resultperm2.mat tb dom
% % % %save resultnew5.mat tb dom
% % % %save resultnew6.mat tb dom
% % % 
% % % %save Inclusions.mat tb 
% % % 
% % % 
% % % badeig
% % % lambdaL(n)=min(min(nexttobad));
% % % Constant(n)=Nx^2/lambdaL(n);    
%coarsetest
%pause(0.2)
end
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

%save addtest1

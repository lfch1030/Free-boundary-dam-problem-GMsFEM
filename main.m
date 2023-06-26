%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function

    for N=4
for n=4
exponent=4;
mu=10^(exponent-1)-1;

read_perm_juan
k1perm=k1;
max_it=2000;
tol=0.000001;
ax=0;bx=1;ay=0;by=1;
Nx=2^N; Ny=Nx;
nx=2^n;ny=nx;

ov=2;


max_it=1000;

[dom_ov2,nvel_ov2]=localsetting_ov2(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);
[dom_ov,nvel_ov]=localsetting_ov(ax,bx,ay,by,Nx,Ny,nx,ny,ov,mu,k1perm);
[dom,b,nvel]=localsetting(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm);
bnew=applay_Aadd_inv(b,dom,dom_ov,Nx,Ny);

vones=createone(b,dom,Nx,Ny);


dom_ov2=linearones(dom,dom_ov2,Nx,Ny,b);
dom_ov2=linearms(dom,dom_ov2,Nx,Ny,b);
A0=coarse_matrix(dom,dom_ov2,Nx,Ny);
A0MS=coarse_matrix_MS(dom,dom_ov2,Nx,Ny);

%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, max_it, tol,dom,Nx,Ny);

% [x, error, iter, flag, lambdamax, condnumber] = Apcgmain(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny);
% 
% 
% [x, error, iter, flag, lambdamax, condnumber] = Padcg(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
% xp=x;
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny);

[x, error, iter, flag, lambdamax, condnumber] = Apcg_ADD_2LMAIN(b*0, b,b, max_it, tol,dom,dom_ov,dom_ov2,Nx,Ny,mu,A0);

%plot_vector(b,dom,Nx,Ny)
Iter(n,N)=iter;
Cond(n,N)=condnumber;
    end
end
% 
% for n=1:4
%     for N=1:4
%         fprintf('%d (%.2f) &   ', Iter(n,N),Cond(n,N))
%         
%     end
%             fprintf('\n  ', Iter(n,N),Cond(n,N))
% 
% end

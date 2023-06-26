%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function

ax=0;bx=1;
Nx=10;
nx=20;
max_it=1000;
tol=0.00001;

ov=1;


[dom_ov,nvel_ov]=localsetting_ov1D(ax,bx,Nx,nx,ov);
[dom,b,nvel]=localsetting1D(ax,bx,Nx,nx,0);
%bnew=applay_Aadd_inv(b,dom_ov,Nx,Ny);

%vones=createone(b,dom,Nx,Ny);

[x, error, iter, flag, lambdamax, condnumber] = Apcg1D(b*0, b,b, max_it, tol,dom,dom_ov,Nx);

%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);


%[x, error, iter, flag, lambdamax, condnumber] = Padcg(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%xp=x;
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0, x,b, max_it, tol,dom,dom_ov,Nx,Ny);

%plot_vector(b,dom,Nx,Ny)
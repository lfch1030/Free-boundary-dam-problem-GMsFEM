%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function
for pw=2
ax=0;bx=1;ay=0;by=1;
N=2;
n=2^5;
ov=3;

max_it=5000;

tol=0.000001;

[dom_ov,nvel_ov]=localsetting_ov1D(ax,bx,N,n,ov);
[dom_ov2,nvel_ov2]=localsetting_ov1D2(ax,bx,N,n,n);



[dom,b,nvel]=localsetting1D(ax,bx,N,n,ov);

dom_ov2=createlinear1D(b,dom_ov2,N);
dom_ov2=createms1D(b,dom_ov2,dom,N);

dir=b*0;
dir(1)=0;
n2=max(size(b));
dir(n2)=0;
Ad=applay_A1D(dir,dom,N);
bnew=b-Ad*0;

A0=coarse_matrix1D(dom_ov2,dom,N);
%vones=createone(b,dom,Nx,Ny);

%[x, error, iter, flag, lambdamax, condnumber] = Acg1D(b*0, bnew,bnew, max_it, tol,dom,N);
%x=x;

[xpc, errorpc, iterpc, flagpc, lambdamaxpc, condnumberpc] = Apcg1D(b*0, bnew,bnew, max_it, tol,dom,dom_ov,dom_ov2,N,A0);
%xpc=xpc;
Iter(pw)=iterpc;
Dim(pw)=N*n;
Cnum(pw)= condnumberpc;
end
% %  for pw=2:6
% %  fprintf('%d------%d(%.2f) \n ', pw,Iter(pw),Cnum(pw))
% %  end
%IM=[iterpc,iter]
%LM=[condnumberpc,condnumber]
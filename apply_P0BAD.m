function w=apply_P0BAD(x,dom_ov,Nx,Ny,A0,dir)

x0=apply_R0BADB(x,dom_ov,Nx,Ny);
w0=x0*0;
%  b=x0;
%  Nvar=(Nx-1)*(Ny-1);
%  I=1:Nvar;
%  A11=A0(I,I);
%  A12=A0(I,I+Nvar);
%  A21=A0(I+Nvar,I);
%  A22=A0(I+Nvar,I+Nvar);
%  b1=b(I);b2=b(I+Nvar);
%  S=A22-A21*(A11\A12);
%  b2new=b2-A21*(A11\b1);
% % x2=S\b2new;
% %x2=A22\b2;
% %x1=A11\(b1-A12*x2);
% %x1=(A11\b1);
%w0=[x1;x2];
%whos A0 x0 dir
free=setdiff(1:length(A0),dir);
w0(free)=A0(free,free)\x0(free);
w=apply_R0BADB_T(w0,dom_ov,Nx,Ny);
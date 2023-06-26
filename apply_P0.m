function w=apply_P0(x,dom_ov,Nx,Ny,A0,dir)

x0=apply_R0(x,dom_ov,Nx,Ny);

n=size(A0,2);
I=1:n;
free=setdiff(I,dir);

w0=0*x0;
w0(dir)=0;
w0(free)=A0(free,free)\x0;

%w0=A0\x0;
w=apply_R0_T(w0,dom_ov,Nx,Ny);
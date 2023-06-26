function w=apply_P0MS(x,dom_ov,Nx,Ny,A0)

x0=apply_R0MS(x,dom_ov,Nx,Ny);
whos x0 A0

w0=A0\x0';
w=apply_R0MS_T(w0,dom_ov,Nx,Ny);
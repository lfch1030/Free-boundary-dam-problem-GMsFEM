function w=apply_P0B(x,dom_ov,Nx,Ny,A0)

x0=apply_R0B(x,dom_ov,Nx,Ny);

w0=A0\x0;
w=apply_R0B_T(w0,dom_ov,Nx,Ny);
function w=apply_P0EMAM(x,dom_ov,Nx,Ny,A0)

x0=apply_R0EMAM(x,dom_ov,Nx,Ny);

w0=A0\x0;
w=apply_R0EMAM_T(w0,dom_ov,Nx,Ny);

x2C;
Ax2C= applay_A(x2C,dom,Nx,Ny);
z02C=apply_P0BAD(b,dom_ov,Nx,Ny,A02C);
Az0= applay_A(z02C,dom,Nx,Ny);
CEz0Ex=full(dot(x2C,Ax2C)/dot(z02C,Az0))


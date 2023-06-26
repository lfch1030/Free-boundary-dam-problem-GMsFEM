
ndim=max(size(b));
hwaitbar = waitbar(0,'Please wait...');
Id=speye(ndim);
BA=0*Id;
for i=1:ndim
    x=Id(:,i);
%        x=zerodir(x,dom,Nx,Ny);

    Ax=applay_A(x,dom,Nx,Ny);
      Ax=zerodir(Ax,dom,Nx,Ny);

       zlocal  = apply_A2ladd_inv(Ax,dom_ov,Nx,Ny,A02C);
       z0=apply_P0BAD(Ax,dom_ov,Nx,Ny,A02C);
       z=zlocal+z0; 

  z=zerodir(z,dom,Nx,Ny);
 B(:,i)=z;
 waitbar(i/n)
end
close(hwaitbar)
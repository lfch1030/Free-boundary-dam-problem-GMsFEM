function A=assam_matrixAN(x,dom,Nx,Ny)

Id=eye(max(size(x)));
A=0*Id;
for i=1:max(size(x))

A(:,i)=applay_AN(Id(:,i),dom,Nx,Ny);

end

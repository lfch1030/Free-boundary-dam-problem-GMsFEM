function A=assam_matrixAD(x,dom,Nx,Ny)

Id=eye(max(size(x)));
A=0*Id;
for i=1:max(size(x))

A(:,i)=applay_A(Id(:,i),dom,Nx,Ny);

end

function A=assam_matrixM(x,dom,Nx,Ny)

Id=eye(max(size(x)));

for i=1:max(size(x))

A(:,i)=applay_M(Id(:,i),dom,Nx,Ny);

end

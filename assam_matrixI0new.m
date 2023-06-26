function A=assam_matrixI0new(x,dom,dom_ov,Nx,Ny,mu)

Id=eye(max(size(x)));
A=0*Id;
for i=1:max(size(x))

A(:,i)=applay_I0new(Id(:,i),dom,dom_ov,Nx,Ny,mu);

end

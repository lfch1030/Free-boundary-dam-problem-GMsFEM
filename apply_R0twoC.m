function x0=apply_R0twoC(x,dom_ov,Nx,Ny)

x0=sparse(2*(Nx-1)*(Ny-1),1);
for i1=1:Nx-1
    for i2=1:Ny-1
        I=(Nx-1)*(i2-1)+i1;
                phi1=dom_ov(i1,i2).philin2;
                x0(I)=dot(x,phi1);
    end
end

for j1=1:Nx-1
    for j2=1:Ny-1
        
        J=(Nx-1)*(j2-1)+j1;
        J=I+J;
                phi1=dom_ov(j1,j2).phiEM2PU;
                x0(J)=dot(x,phi1);
        
    end
end

function x0=apply_R0(x,dom_ov,Nx,Ny)

x0=sparse((Nx-1)*(Ny-1),1);
for i1=2:Nx
    for i2=2:Ny
        I=(Nx-1)*(i2-1)+i1;
                phi1=dom_ov(i1,i2).philin;
                x0(I)=dot(x,phi1);
    end
end

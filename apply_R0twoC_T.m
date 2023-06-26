function x=apply_R0twoC_T(x0,dom_ov,Nx,Ny)

x=0*(dom_ov(1,1).philin);
%x0=sparse((Nx-1)*(Ny-1),1);
for i1=1:Nx-1
    for i2=1:Ny-1
        I=(Nx-1)*(i2-1)+i1;
                phi1=dom_ov(i1,i2).philin2;
                x=x+x0(I)*phi1;
    end
end

for j1=1:Nx-1
    for j2=1:Ny-1
        J=(Nx-1)*(j2-1)+j1;
        J=I+J;
                phi1=dom_ov(j1,j2).phiEM2PU;
                x=x+x0(J)*phi1;
%                                 plot_vector(x, dom,Nx,Ny, 999999999,[]);
%                 pause

    end
end


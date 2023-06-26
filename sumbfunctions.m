
sumbf=0*b;
for i1=1:Nx-1;
    for i2=1:Ny-1;
        sumbf=sumbf+dom_ov(i1,i2).phiEM2PU;
       plot_vector(dom_ov(i1,i2).psi2, dom,Nx,Ny,mu,[]); view(2)
              title(i2)

       hold off
       pause
    end
    
end
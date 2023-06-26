tx=x*0;
Oxi=x;applay_A(x,dom,Nx,Ny);

for i1=1:Nx-1
    for i2=1:Ny-1

xi=applay_AI_inv2(Oxi,dom_ov,i1,i2);
plot_vector(xi,dom,Nx,Ny);
dom_ov(i1,i2).phimin=xi;
pause(0.1)

hold off
tx=tx+xi;        
    end
end
figure(2)
plot_vector(tx,dom_ov,Nx-1,Ny-1);

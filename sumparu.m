tx=x*0;

for i1=1:Nx-1
    for i2=1:Ny-1
philin=dom_ov(i1,i2).philin;
plot_vector(philin,dom,Nx,Ny);
pause
hold off
xi=applay_A_I(philin,dom_ov,i1,i2);
plot_vector(xi,dom,Nx,Ny);

pause

hold off
tx=tx+xi;        
    end
end
figure(2)
plot_vector(tx,dom_ov,Nx-1,Ny-1);

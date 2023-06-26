tx=x*0;
Oxi=xp;applay_A(x,dom,Nx,Ny);

for i1=1:Nx-1
    for i2=1:Ny-1

xi=applay_AI_inv(Oxi,dom_ov,i1,i2);
plotnew_vector(xi,dom,Nx,Ny);

pause
hold off
Axi=applay_A_I(xi,dom_ov,i1,i2);
plotnew_vector(Axi,dom,Nx,Ny);
pause

hold off
tx=tx+xi;        
    end
end
figure(2)
plot_vectornew(tx,dom_ov,Nx,Ny);

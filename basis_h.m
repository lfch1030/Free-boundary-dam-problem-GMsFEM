
 GT=interface_index(dom,Nx,Ny);
nvar=size(GT,2);

for bf=1:nvar

    x=b*0;
    x(GT(bf))=1;
    uI=extent_to_int2(x,dom,Nx,Ny);
    plot_vector(uI+x,dom,Nx,Ny);
    pause(0.1)
    hold off
    
    
    
end
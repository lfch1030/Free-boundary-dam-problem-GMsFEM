function w=countsubdomains(u,dom,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    Ig=dom(i1,i2).Ig;    
    w(Ig)=w(Ig)+1;
    end
end
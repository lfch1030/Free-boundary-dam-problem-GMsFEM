function w=datadir(u,dom,Nx,Ny)
w=0*u;
for i1=1:Nx
    for i2=1:Ny
    Igfree=dom(i1,i2).Igfree;
    Ig=dom(i1,i2).Ig;
    v=dom(i1,i2).v;
    du=solution(v(:,1),v(:,2));
    w(Ig)=du;
    w(Igfree)=0;
    
    end
end


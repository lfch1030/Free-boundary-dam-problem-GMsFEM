function w=creacoef(u,dom,Nx,Ny,mu,k1perm)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    AI=dom(i1,i2).A;
    v=dom(i1,i2).v;
    Igfree=dom(i1,i2).Igfree;
    Ifree=dom(i1,i2).free;
    vx=v(Ifree,1); vy=v(Ifree,2);
    w(Igfree)=coeficient(vx,vy,mu,k1perm);
    end
end
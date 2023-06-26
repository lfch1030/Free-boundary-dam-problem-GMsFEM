nvel=length(b);
A=sparse(nvel,nvel);

for i1=1:Nx
    for i2=1:Ny
    Ig=dom(i1,i2).Ig;
    A(Ig,Ig)=A(Ig,Ig)+dom(i1,i2).A;
    
    end
end

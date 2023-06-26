
function w=apply_O2(u,dom,Nx,Ny,N0left, N0right)
Au=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=Ny
    A=dom(i1,i2).BupNOk;
    free=dom(i1,i2).free;
    AI=A(free,free);
    Igfree=dom(i1,i2).Igfree;
    lu=u(Igfree);
    lAu=AI*lu;
    Au(Igfree)=Au(Igfree)+lAu; 
    end
end



for i1=1
    for i2=N0left:Ny
    A=dom(i1,i2).BleftNOk;
    free=dom(i1,i2).free;
    AI=A(free,free);
    Igfree=dom(i1,i2).Igfree;
    lu=u(Igfree);
    lAu=AI*lu;
    Au(Igfree)=Au(Igfree)+lAu; % because of normal
    end
end


for i1=Nx
    for i2=N0right:Ny
    A=dom(i1,i2).BrightNOk;
    free=dom(i1,i2).free;
    AI=A(free,free);
    Igfree=dom(i1,i2).Igfree;
    lu=u(Igfree);
    lAu=AI*lu;
    Au(Igfree)=Au(Igfree)+lAu; %  because of normal
    end
end




w=Au;


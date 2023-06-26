nvel=length(b);
A=sparse(nvel,nvel);
opO=A;

free=[];
%Ap= applay_A(p,dom,Nx,Ny)
%+(0.5/deltat)*applay_M(p,dom,Nx,Ny)+
%0.5*apply_O1(p,dom,Nx,Ny,N0left,N0right);

for i1=1:Nx
    for i2=1:Ny
    free=[free,dom(i1,i2).Igfree];
    end
    
    i2=1;
    free=[free,dom(i1,i2).B.vdown'];    
end

free=setdiff(free,[1,Nx*nx+1]);

Anorma=sparse(nvel,nvel);
for i1=1:Nx
    for i2=1:Ny
    Ig=dom(i1,i2).Ig;
            MI=dom(i1,i2).Mass;
            AI=dom(i1,i2).A;
    Anorma(Ig,Ig)=Anorma(Ig,Ig)+AI;
    
    end
end



for i1=1:Nx
    for i2=1:Ny
    Ig=dom(i1,i2).Ig;
            MI=dom(i1,i2).Mass;
            AI=dom(i1,i2).A;
    A(Ig,Ig)=A(Ig,Ig)+AI+(0.5/deltat)*MI;
    
    end
end


for i1=1:Nx
    for i2=1
    lAu=dom(i1,i2).Bdown;
    Ig=dom(i1,i2).Ig;
    opO(Ig,Ig)=opO(Ig,Ig)-lAu; % negative because of normal
    end
end


% 
for i1=1:Nx
    for i2=Ny
    lAu=dom(i1,i2).Bup;
    Ig=dom(i1,i2).Ig;
    opO(Ig,Ig)=opO(Ig,Ig)+lAu;
    end
end



for i1=1
    for i2=N0left:Ny
    lAu=dom(i1,i2).Bleft;
    Ig=dom(i1,i2).Ig;
    opO(Ig,Ig)=opO(Ig,Ig)-lAu; % negative because of normal
    end
end

for i1=Ny
    for i2=N0right:Ny
    lAu=dom(i1,i2).Bright;
    Ig=dom(i1,i2).Ig;
    opO(Ig,Ig)=opO(Ig,Ig)+lAu; % negative because of normal
    end
end






for i1=1:Nx
    for i2=Ny
    lA=dom(i1,i2).BupNOk;
    Ig=dom(i1,i2).Ig;
    opO(Ig,Ig)=opO(Ig,Ig)+lA;
    end
end



for i1=1
    for i2=N0left:Ny
    lA=dom(i1,i2).BleftNOk;
    Ig=dom(i1,i2).Ig;
    opO(Ig,Ig)=opO(Ig,Ig)+lA;
    end
end


for i1=Nx
    for i2=N0right:Ny
    lA=dom(i1,i2).BrightNOk;
    Ig=dom(i1,i2).Ig;
    opO(Ig,Ig)=opO(Ig,Ig)+lA;
    end
end











A=A+0.5*opO;


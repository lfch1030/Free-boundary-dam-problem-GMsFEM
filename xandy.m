function [wx, wy]=xandy(u,dom,Nx,Ny)
wx=sparse(size(u,1),size(u,2));
wy=wx;
for i1=1:Nx
    for i2=1:Ny
    AI=dom(i1,i2).A;
    v=dom(i1,i2).v;
    Igfree=dom(i1,i2).Ig;
    wx(Igfree)=v(:,1);
    wy(Igfree)=v(:,2);
%    w(Igfree)=v(:,1)*0;
    end
end
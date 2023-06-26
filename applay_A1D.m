function w=applay_A1D(u,dom,Nx)
Au=sparse(size(u,1),size(u,2));

for i1=1:Nx
    A=dom(i1).A;
    Ig=dom(i1).Ig;
%    Igfree=Ig(2:dom(i1).mesh.nex);
%    free=2:dom(i1).mesh.nex;
    lu=u(Ig);
%    AI=A(free,free);
    lAu=A*lu;
    Au(Ig)=Au(Ig)+lAu;
end

% 
%     A=dom(1).A;
%     Ig=dom(1).Ig;
%     Igfree=Ig(2:dom(i1).mesh.nex+1);
%     free=2:dom(i1).mesh.nex+1;
%     lu=u(Igfree);
%     AI=A(free,free);
%     lAu=AI*lu;
%     Au(Igfree)=Au(Igfree)+lAu;
% 
%     A=dom(Nx).A;
%     Ig=dom(Nx).Ig;
%     Igfree=Ig(1:dom(Nx).mesh.nex);
%     free=1:dom(Nx).mesh.nex;
%     lu=u(Igfree);
%     AI=A(free,free);
%     lAu=AI*lu;
%     Au(Igfree)=Au(Igfree)+lAu;
% 
w=Au;

function dom_ov2=createms1D(x,dom_ov2,dom,N);

for j=1:N-1
phims=x*0;
    
for i=1:N
philin=dom_ov2(j).phi;

    A=dom(i).A;
    Ig=dom(i).Ig;
    
    Igfree=Ig(2:dom(i).mesh.nex);
    free=2:dom(i).mesh.nex;

    phidir=philin(Ig);
    phidir(free)=0;
    lu=A*phidir;
    lAu=phidir;
    AI=A(free,free);
    lAu(free)=AI\lu(free);
    phims(Ig)=phidir;
end
dom(j).phims=phims;
end
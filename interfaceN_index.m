function GT=interfaceN_index(dom,Nx,Ny)
GT=[];
for i1=1:Nx
    for i2=1:Ny
    Ig=dom(i1,i2).Ig;
    B=dom(i1,i2).B;
    bry=[B.vup;B.vleft;B.vdown;B.vright];
    It=1:size(Ig,2);
    G=unique(bry);
    G2=G;
    G2=Ig(G2);
    GT=[GT,G2];
    GT=unique(GT);
    end
end


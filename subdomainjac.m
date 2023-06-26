function J=subdomainjac(cd,M,v)

nv=size(v,1);
c=cd(1:nv);
d=cd(nv+1:2*nv);

ne=size(M,1);

for e=1:ne
    T=M(e,:);
    Je=jacelement(T,v,c,d);
    J(e)=Je;
end


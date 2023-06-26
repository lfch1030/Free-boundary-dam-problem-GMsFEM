function [vnew,last]=newsubdomainmesh(M,v,mesh,coeff,last)

ne=mesh.nv-1;
vaux=v;
vnew=vaux;
vnew(1)=last;

    Taux=v(M(1,:));
    vnew(1+1)=last+coeff(1)*(Taux(2)-Taux(1));
    vaux=vnew;

for i=2:ne
    Taux=v(M(i,:));
    T=vaux(M(i,:));
    vnew(i+1)=T(1)+coeff(i)*(Taux(2)-Taux(1));
    vaux=vnew;
end
last=vnew(ne+1);
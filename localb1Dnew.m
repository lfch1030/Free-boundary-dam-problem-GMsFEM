function L=localb1Dnew(T,w,Tcoeff)

    v(1)=w(T(1));
    v(2)=w(T(2));
    

aux1=quad(@(x)f0psi1(x/Tcoeff,v(1),v(2)), v(1),v(2));
aux2=quad(@(x)f0psi2(x/Tcoeff,v(1),v(2)), v(1),v(2));
L(1,1)=aux1; L(2,1)=aux2;


function zf=f0(uf)
zf=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function z1=f0psi1(x,v1,v2)
z1=f0(x).*(v2-x)/(v2-v1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function z2=f0psi2(x,v1,v2)
z2=f0(x).*(x-v1)/(v2-v1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

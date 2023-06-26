
S=Schur_matrix(dom,Nx,Ny,b);
GT=interface_index(dom,Nx,Ny);
VT=vertex_index(dom,Nx,Ny);
F=1:size(GT,2);
[DIF,I]=setdiff(GT,setdiff(GT,VT));
V=I;
F=setdiff(F,V);
SFF=S(F,F);
SFV=S(F,V);
SVF=S(V,F);
SVV=S(V,V);
P=SVV-SVF*(SFF\SFV);
bG=bnew(GT);
bV=bG(V);
bF=bG(F);
bnewnew=bV-SVF*(SFF\bF);
z=P\bnewnew;
z=0*z;
z(1)=1;

xV=0*x;
xV(VT)=z;

zF=SFF\(bF-SFV*z);
%zF=-SFF\SFV*z;
xF=x*0;
xF(GT(F))=zF;

uI=extent_to_int2(xF,dom,Nx,Ny);

function [M, N,v,par,h,Ig]=createmeshAS1D(nx,intx,Nx,I1)

% Create a triangulation of the [a1,b1]x[a2,b2].
% This triangulation is like 
%
% 1-----2-----3-----4-----5
%
nex=nx;


ax= intx(1);    bx= intx(2);

hx=(bx-ax)/nex;

% h = waitbar(0,'Please wait...meshing');
h.hx=hx;

for ix=1:nex+1;
    Ilocalx=(I1-1)*nx+1+(ix-1);
    Ig(ix)=Ilocalx;
    v(ix,1)=ax+(ix-1)*(bx-ax)/nex; % x-coor. of the vertex
end
% close(h)
for ix=1:nex;
    M(ix,:)=[ix,ix+1]; % x-coor. of the vertex
end
% 

par.nex=nex;
par.ne=nex;
par.nv=nex+1;
par.ax=ax;
par.bx=bx;
par.hx=hx;
%par.nvel1=(2*par.nex+1)*(2*par.ney+1);


%list  of boundary vertices.
N.e=[1,nex];

N.v=[1,nex+1];

N.d=N.v;





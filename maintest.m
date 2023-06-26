ax=0;bx=1;ay=0;by=1;
Nx=1; Ny=Nx;
nx=30;ny=nx;

[dom,b,nvel]=localsettingnew(ax,bx,ay,by,Nx,Ny,nx,ny);

free=dom(1,1).free;
I=dom(1,1).Ig;
d=setdiff(I,free);
A=dom(1,1).A;
vx=dom(1,1).v(:,1);
vy=dom(1,1).v(:,2);
cf=vy;
nb=0*b;
sol=0*b;
sol(d)=cf(d);
nb(free)=b(free)-A(free,d)*cf(d);
 sol(free)=A(free,free)\nb(free);
% Alm=[A,ones(size(b));ones(size(b')),0];
% soln=Alm\[b;0];




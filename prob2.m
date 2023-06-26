
function W2=prob2(m2)

load A2.dat;
m=m2;
N=size(A2,1);
[V2, D2]=eigs(A2,m);
V2=V2*sqrt(N);
V2=V2*sqrt(D2);

N1=10;
N2=50;

NN1=100; 
NN2=20;

dx=1.0/(N2-1);
dy=1.0/(N1-1);

x1=0:dx:1.0;
y1=0:dy:1.0;

[X1,Y1]=meshgrid(x1,y1);

dx=1.0/(NN2-1);
dy=1.0/(NN1-1);
x2=0:dx:1.0;
y2=0:dy:1.0;

[X2,Y2]=meshgrid(x2,y2);

for i=1:m
SS=interp2(X1,Y1,reshape(V2(:,i),N1,N2),X2,Y2);
S(1:NN1,1:NN2,i)=SS(1:NN1,1:NN2);
end


W2=reshape(S,NN1*NN2,m);



function W1=prob1(m1)

load A1.dat;
m=m1;
N=size(A1,1);
[V1, D1]=eigs(A1,m);
V1=V1*sqrt(N);
V1=V1*sqrt(D1);

N1=50;
N2=50;

NN1=100; 
NN2=40;


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
SS=interp2(X1,Y1,reshape(V1(:,i),N1,N2),X2,Y2);
S(1:NN1,1:NN2,i)=SS(1:NN1,1:NN2);
end


W1=reshape(S,NN1*NN2,m);




function W3=prob3(m3)

load A3.dat;
m=m3;
N=size(A3,1);
[V3, D3]=eigs(A3,m);
V3=V3*sqrt(N);
V3=V3*sqrt(D3);


N1=25;
N2=25;

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
SS=interp2(X1,Y1,reshape(V3(:,i),N1,N2),X2,Y2);
S(1:NN1,1:NN2,i)=SS(1:NN1,1:NN2);
end


W3=reshape(S,NN1*NN2,m);

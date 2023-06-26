M=mu+1;

randn('state',391)

N1=50;
N2=100;

NN=100; %interpolating grid

m=200;

dx=1.0/(N2-1);
dy=1.0/(N1-1);

x1=0:dx:1.0;
y1=0:dy:1.0;


fid=fopen('perm_test2.dat','r');
y=fscanf(fid,'%f',inf);

V=reshape(y,N1*N2,m);

[X1,Y1]=meshgrid(x1,y1);


dx=1.0/(NN-1);
x2=0:dx:1.0;
y2=x2;

[X2,Y2]=meshgrid(x2,y2);

for i=1:m
SS=interp2(X1,Y1,reshape(V(:,i),N1,N2),X2,Y2);
S(:,:,i)=SS(:,:);
end


W=reshape(S,NN*NN,m);


k1=W*randn(m,1)+randn(NN*NN,1)*0.3;


k2=ones(NN*NN,1);
jj=find(k1>-0.2);
k2(jj)=M/10;
jj1=find(k1>0.4);
  k2(jj1)=M;

k=reshape(k2,NN,NN);

k(1:10,:)=1;
k(91:100,:)=1;
k(:,1:10)=1;
k(:,91:100)=1;

%imagesc(k)

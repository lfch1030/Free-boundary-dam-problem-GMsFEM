
value=0;

t1=randn(m1,1);
t2=randn(m2,1);
t3=randn(m3,1);

E1=reshape(W1*t1,100,40);
E2=reshape(W2*t2,100,20); %middle.
E3=reshape(W3*t3,100,40);

E1=E1/2;
E2=max(E2,0)/2+7; %control mean and variace
E3=E3/2;

E=[E1 E2 E3]; 

xx1=[2 2; 2 3; 3 3; 3 4; 4 4; 4 5; 5 5; 6 5; 7 5; 2 8; 3 8; 4 8; 5 8; 6 8];
xx2=[2 2; 2 3; 3 3;3 4; 4 4; 5 5; 6 6; 7 7; 8 8; 2 8; 2 7; 3 8; 3 7];
a=[[2:8]' 4*ones(7,1)]; b=[[2:8]' 5*ones(7,1)]; 
xx3=[a' b']';
XX=[];
for ii=5:6
 for i=1:10
    s=ceil(rand*12);
    if s==1
     for j=1:size(xx1,1)
        E((i-1)*10+xx1(j,1),(ii-1)*10+xx1(j,2))=1;
        XX=[XX;[(i-1)*10+xx1(j,1) (ii-1)*10+xx1(j,2)]];
     end
    end
    if s==2
        for j=1:size(xx2,1)
        E((i-1)*10+xx2(j,1),(ii-1)*10+xx2(j,2))=1;
        XX=[XX; [(i-1)*10+xx2(j,1),(ii-1)*10+xx2(j,2)]];
     end
    end
     if s==3
        for j=1:size(xx3,1)
        E((i-1)*10+xx3(j,1),(ii-1)*10+xx3(j,2))=1;
        XX=[XX; [(i-1)*10+xx3(j,1),(ii-1)*10+xx3(j,2)]];
     end
    end
 end
end
    
E(25:60, 48:51)=value;
imagesc(E')

fid=fopen('perm_juan.dat','w');
fprintf(fid,'%f ', E);
fclose(fid);


fid=fopen('perm_juan_lv.dat','w');
fprintf(fid,'%f ', XX);
fclose(fid);


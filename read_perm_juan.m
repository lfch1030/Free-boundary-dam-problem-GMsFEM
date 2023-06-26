clear k1 k1aux 
value=1;
eta=exponent;



fid=fopen('perm_juan.dat','r');
y=fscanf(fid,'%f',inf);
k1aux=reshape(y,100,100);

k1=k1aux;
k1(1:100,41:60)=k1aux(1:100,41:60)+eta;

fclose(fid);
fid=fopen('perm_juan_lv.dat','r');
z=fscanf(fid,'%f',inf);
XX1=reshape(z,size(z,1)/2,2);
fclose(fid);
 for i=1:size(XX1,1)
     k1(XX1(i,1),XX1(i,2))=value;
 end
    
k1(26, 41:60)=value;
k1(47, 41:60)=value;
k1(88, 41:60)=value;

fclose('all');
%Juan. You can lower value to make the contrast stronger. k1 is
%log-conductivity
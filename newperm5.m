


M=mu; %contrast


rand('twister',50482)
k=ones(100,100);


I1=[3,4]; J1=1:10;
I2=[7,8]; J2=[4:6];

for i=1:4

    for j=1:8
        
        k(i*10+I1,j*10+J1)=M;
%        k(i*10+I1,j*10+J2)=M;
% %         k(i*10+I2,j*10+J1)=M;
        k(i*10+I2,j*10+J1)=M;
    end
end

for i=5:8

    for j=1:4
        
        k(i*10+I1,j*10+J2)=M;
%        k(i*10+I1,j*10+J2)=M;
% %         k(i*10+I2,j*10+J1)=M;
%%        k(i*10+I2,j*10+J1)=M;
    end
end
for i=5:8

    for j=5:8
        k(i*10+J1,j*10+I1)=M;
%        k(i*10+I1,j*10+J2)=M;
% %         k(i*10+I2,j*10+J1)=M;
        k(i*10+J1,j*10+I2)=M;
    end
end
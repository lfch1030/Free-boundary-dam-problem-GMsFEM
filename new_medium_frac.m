
Mu1=mu; %contrast
%Mu1=1000;

rand('twister',50482)
k=ones(100,100);
R=1;
rot=[sqrt(3)/2, 1/2; - 1/2,sqrt(3)/2];
v=[10,10;85,80];
M=[1,2];

[v,M]=treeHata1(v,M);
[v,M]=treeHata1(v,M);
v=floor(v);
i=1;
gros=5;
gros1=1;
gros2=5;
gros3=1;
gros4=9;
% for i=1:size(M)
%      ver=[v(M(i,:),1),v(M(i,:),2)];
%      
%      for t=0:9
%         rec1=floor((ver(2,:)-ver(1,:))*(t/11)+ver(1,:));
%         k(rec1(1)+(-gros4:gros4),rec1(2)+(-gros4:gros4))=Mu1;
%        
%      end
%      
% end
% 
% for i=1:size(M)
%      ver=[v(M(i,:),1),v(M(i,:),2)];
%      
%      for t=0:9
%         rec1=floor((ver(2,:)-ver(1,:))*(t/11)+ver(1,:));
%         k(rec1(1)+(-gros3:gros3),rec1(2)+(-gros3:gros3))=1;
%        
%      end
%      
% end
% for i=1:size(M)
%      ver=[v(M(i,:),1),v(M(i,:),2)];
%      
%      for t=0:9
%         rec1=floor((ver(2,:)-ver(1,:))*(t/11)+ver(1,:));
%         k(rec1(1)+(-gros2:gros2),rec1(2)+(-gros2:gros2))=Mu1;
%        
%      end
%      
% end

for i=0:9
     ver=[10,15+i*8;100,15+i*8];
     r = randi([50 55],1);
     for t=0:r
         r1 = randi([25 r],1);
        rec1=floor((ver(2,:)-ver(1,:))*(t/r1)+ver(1,:));
        k(rec1(1)+(-gros3:gros3),rec1(2)+(-gros3:gros3))=Mu1;
       
     end
     
end

for i=1:size(M)
     ver=[v(M(i,:),1),v(M(i,:),2)];
     for t=0:9
        rec1=floor((ver(2,:)-ver(1,:))*(t/11)+ver(1,:));
        k(rec1(1)+(-gros:gros),rec1(2)+(-gros:gros))=1;     
     end
    
end

for i=1:size(M)
     ver=[v(M(i,:),1),v(M(i,:),2)];
     
     for t=0:9
        rec1=floor((ver(2,:)-ver(1,:))*(t/11)+ver(1,:));
        k(rec1(1)+(-gros1:gros1),rec1(2)+(-gros1:gros1))=Mu1;
       
     end
     
end

k(1:10,:)=1;
k(91:100,:)=1;
k(:,1:10)=1;
k(:,91:100)=1; 

k(101:end,:)=[];
k(:,101:end)=[];

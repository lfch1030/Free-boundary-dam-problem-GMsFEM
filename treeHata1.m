function [vnew,Mnew]=treeHata1(v,M)

%v=[0,0;1,0];
%M=[1,2];


alpha=pi/3;

vnew=zeros(length(v)+2*size(M,1),2);
Mnew=zeros(3*size(M,1),2);


s=length(v);
vnew(1:length(v),:)=v;
t=0;


for i=1:size(M,1)
       
     
   a=v(M(i,1),:);
   b=v(M(i,2),:);
   c=(2*a+b)/3;
   d=(b-a)/3;
   e=(a+2*b)/3;
   
   vnew(s+1,:)=c;
   vnew(s+2,:)=c+d*[cos(alpha),-sin(alpha);sin(alpha),cos(alpha)];
   vnew(s+3,:)=e;
   vnew(s+4,:)=e+d*[cos(-alpha),-sin(-alpha);sin(-alpha),cos(-alpha)];
     
    Mnew(t+1,:)=[M(i,1),s+1];
    Mnew(t+2,:)=[s+1,s+2];
    Mnew(t+3,:)=[s+1,s+3];
    Mnew(t+4,:)=[s+3,s+4];
    Mnew(t+5,:)=[s+3,M(i,2)];
  
   s=s+4;
   t=t+5;
end
 

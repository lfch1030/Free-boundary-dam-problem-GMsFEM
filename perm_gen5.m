
Mexp=10^(n-1);
k=ones(80,80);
x=linspace(0,1,80);
y=linspace(0,1,80);

f=inline('(0.3*sin(2*pi*x)+1.1*sqrt(x))*0.5+0.1');

g=inline('(0.3*sin(2*pi*x)+1.1*sqrt(x))*0.5+0.2');

rand('twister',50482)
for i=1:2:8
    for j=1:8
        if rand>0.5
         k(4+(i-1)*10:6+(i-1)*10,4+(j-1)*10:6+(j-1)*10)=Mexp;
        end
    end
end

for i=1:80
    for j=1:80
        if y(j)>=f(x(i)) & y(j)<=g(x(i))
            k(i,j)=Mexp;
        end
    end
end
k(:,72:77)=Mexp;
%imagesc(k') 



for i=1:2:8
          k(1:10,2+(i-1)*10:6+(i-1)*10)=Mexp;
          k(11:20,4+(i-1)*10:8+(i-1)*10)=Mexp;
           k(21:30,5+(i-1)*10:9+(i-1)*10)=Mexp;
           
          k(41:50,2+(i-1)*10:5+(i-1)*10)=Mexp;
          k(51:60,4+(i-1)*10:7+(i-1)*10)=Mexp;
           k(61:70,5+(i-1)*10:8+(i-1)*10)=Mexp;
        
end

% 
% for j=4:4:8 
% k(:,(j-1)*10+1:j*10)=1;
% end


for i=2:2:8
    for j=1:8
k(4+(i-1)*10:6+(i-1)*10,4+(j-1)*10:6+(j-1)*10)=Mexp;

    end
end



for i=1:2:8
    for j=1:7
     k(4+(j-1)*10:6+(j-1)*10,4+(i-1)*10:6+(i-1)*10)=Mexp;
    end
end


for i=2:2:8
%  k((i-1)*10+4:(i-1)*10+6,21:50)=M;
 k(21:30,(i-1)*10+2:(i-1)*10+5)=Mexp;
  k(31:40,(i-1)*10+3:(i-1)*10+6)=Mexp;
   k(41:50,(i-1)*10+4:(i-1)*10+7)=Mexp;
end


for i=2:2:8
  k(71:80,(i-1)*10+4:(i-1)*10+6)=Mexp;
end
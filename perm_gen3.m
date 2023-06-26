
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
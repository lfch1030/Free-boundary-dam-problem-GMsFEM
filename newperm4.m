
M=mu+1;  %contrast




k=ones(100,100);


x=linspace(0,1,100);
y=linspace(0,1,100);
f=inline('(0.3*sin(20*pi*x)+1.1*x^(0.2))*0.5+0.2');
g=inline('(0.3*sin(20*pi*x)+1.1*x^(0.2))*0.5+0.3');




for i=1:100
    for j=1:100
        if x(j)>=f(y(i)) & x(j)<=g(y(i))
            k(j,i)=M;
        end
    end
end



x=linspace(0,1,100);
y=linspace(0,1,100);
f=inline('(0.3*sin(20*pi*x)+0.01*x^(2.2))*0.5+0.2');
g=inline('(0.3*sin(20*pi*x)+0.01*x^(2.2))*0.5+0.3');



r1=rand;
for i=1:100
    for j=1:100
        if x(j)>=f(y(i)) & x(j)<=g(y(i))
            k(j,i)=M;
        end
    end
end



 k(1:10,:)=1;
 k(91:100,:)=1;
 k(:,1:10)=1;
 k(:,91:100)=1;
k(22:25,1:10)=M;
k(62:65,1:10)=M;
k(22:25,91:100)=M;
k(65:67,87:100)=M;
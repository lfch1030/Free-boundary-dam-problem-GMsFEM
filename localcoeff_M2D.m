function L=localcoeff_M2D(T,v,mu,k1perm)


x=zeros(3,1);
y=zeros(3,1);

for j=1:3
    x(j)=v(T(j),1);
    y(j)=v(T(j),2);
end

omega=[9*power(80,-1), (155+sqrt(15))/2400, (155+sqrt(15))/2400,(155+sqrt(15))/2400,(155-sqrt(15))/2400, (155-sqrt(15))/2400,(155-sqrt(15))/2400];

xi=[ power(3,-1), (6+sqrt(15))/21 ,(9-2*sqrt(15))/21,(6+sqrt(15))/21,(6-sqrt(15))/21 ,(9+2*sqrt(15))/21,(6-sqrt(15))/21];

eta=[power(3,-1),(6+sqrt(15))/21,(6+sqrt(15))/21,(9-2*sqrt(15))/21,(6- sqrt(15))/21,(6-sqrt(15))/21, (9+2*sqrt(15))/21];

den=abs(x(2)*y(1)-x(3)*y(1)-x(1)*y(2)+x(3)*y(2)+x(1)*y(3)-x(2)*y(3));


txi=x(1)+xi*(x(2)-x(1))+eta*(x(3)-x(1));
teta=y(1)+xi*(y(2)-y(1))+eta*(y(3)-y(1));
x1=x(1); x2=x(2);x3=x(3);
y1=y(1); y2=y(2);y3=y(3);


coef=coeficient(txi,teta,mu,k1perm);


            integrand=coef;
            L=sum( omega.*integrand);
            A=sum(omega);
L=L/A;

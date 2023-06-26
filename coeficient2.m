function a=coeficient2(x1,x2)
% function a=coeficient(x,y)
 n=1; m=4;
% a=(2+ 0*x1+sin(2*pi*x1*n).*sin(2*pi*x2*m));
a=(1/2)*(x2<=.5)+ (1+300)*(x2>.5);

%a=100*mod(floor(10*x1+10*x2),2)+1;
%a=x1*0+1;
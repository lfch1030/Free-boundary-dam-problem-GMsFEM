function [ux,uy]=grad_solution(x1,x2)

%y=16*x1.*(1-x1).*x2 .*(1-x2);
ux=16*(1-2*x1).*x2.*(1-x2);
%ux=-8*cos(2*pi*x1)*pi.*x2.*(1-x2);

% y=sin(2*pi*x1).*x2.*(1-x2);
uy=16*x1.*(1-x1).*(1-2*x2);
%uy=-4*sin(2*pi*x1).*(1-2*x2);
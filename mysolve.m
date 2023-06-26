

z=fsolve(@(x)diffsquare(x,M,v,coef),[v(:,1);v(:,2)]);

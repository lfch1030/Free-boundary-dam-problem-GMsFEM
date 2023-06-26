function z=phiI1(c,diamx,diamy,vx,vy)

x=(1- abs(vx-c(1))/diamx);
y=(1- abs(vy-c(2))/diamy);
z=x.*y;

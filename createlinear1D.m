
function dom_ov2=createlinear1D(x,dom_ov2,N)
for i=1:N-1
phi=0*x;
a=dom_ov2(i).mesh.ax;
b=dom_ov2(i).mesh.bx;
mid=(a+b)/2;

v=dom_ov2(i).v;
phiaux=1-(2/(b-a))*abs(v-mid);
phiaux=max(phiaux,0);
Ig=dom_ov2(i).Ig;
phi(Ig)=phiaux;
dom_ov2(i).phi=phi;

end
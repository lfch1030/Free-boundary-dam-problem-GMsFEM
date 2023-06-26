function u=coarse_problemms(x,dom_ov2,N,A0)
u=0*x;
x0=sparse(N-1,1);
for i=1:N-1
    phi=dom_ov2(i).phims;
    x0(i)=dot(phi,x);
end

u0=A0\x0;

for i=1:N-1
    phi=dom_ov2(i).phims;
    u=u+u0(i)*phi;
end


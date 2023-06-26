function J=Jac(cd,x,dom,Nx,Ny)
nv=size(x,1);
c=cd(1:nv)';
d=cd(nv+1:2*nv)';

J=[];
for i1=1:Nx
    for i2=1:Ny
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        Ig=dom(i1,i2).Ig;
        cs=c(Ig);
        ds=d(Ig);
        J1=subdomainjac([cs;ds],M,v);
        J=[J;J1'];
    end
end

function dom_ov=localeigenvectors3x3(x,dom_ov, Nx,Ny)

for i1=1:Nx
    for i2=1:Ny
        psi1=0*x;
        psi2=0*x;
        psi3=0*x;
        A=dom_ov(i1,i2).A;
        M=dom_ov(i1,i2).Mass;
        [Q,D]=eig(full(A),full(M));
        [lambda,I]=sort(diag(D),'ascend');
        Q=Q(I,I);
        Ig=dom_ov(i1,i2).Ig;
        psi1(Ig)=Q(:,1);
        psi2(Ig)=Q(:,2);
        psi3(Ig)=Q(:,3);
        dom_ov(i1,i2).psi1=psi1;
        dom_ov(i1,i2).psi2=psi2;
        dom_ov(i1,i2).psi3=psi3;
        dom_ov(i1,i2).lambda=lambda;

        
        
    end
end

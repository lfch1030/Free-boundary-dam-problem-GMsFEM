function dom_ov=localeigenvectorsnew(x,dom_ov, Nx,Ny)

for i1=1:Nx-1
    for i2=1:Ny-1
        A=dom_ov(i1,i2).A;
        M=dom_ov(i1,i2).Mass;
        
        Ig=dom_ov(i1,i2).Ig;
        
     B=dom_ov(i1,i2).B;
    bry=[B.vup;B.vleft;B.vdown;B.vright];
    It=1:size(Ig,2);
    G=unique(bry);
    I=setdiff(It,G);
    Gg=Ig(G);
    IIg=Ig(I);
    
        AII=A(I,I);
    AIG=A(I,G);
    AGI=A(G,I);
    AGG=A(G,G);

    Shat=AII-AIG*(AGG\AGI);
        [QI,DI]=eig(full(Shat),full(AII));
        [lambda,I]=sort(diag(DI),'ascend');
        QI=QI(I,I);
QG=-AGG\(AGI*QI);
whos QG QI
Q=A*0;

for i=1:25
Q(I,i)=QI(:,i);
Q(G,i)=QG(:,i);
end
        
        
%         [Q,D]=eig(full(A),full(M));
%        [Q,D]=eig(full(A));
        Ig=dom_ov(i1,i2).Ig;
        nlambda=max(size(lambda));
        incre=diff(lambda);
        Iincre=incre>5;
        I=1:nlambda-1;
        Ig90=I(Iincre);
         if size(Ig90,2)>=1
%         Nbad=1;
%         else
         Nbad=Ig90(1);
         else
             Nbad=1;
         end
%         end
%        Nbad=4;
%        Nbad=4;
        n=size(x,1);
        psi1=sparse(n,Nbad);
        psi1(Ig,1:(Nbad+1))=Q(:,1:(Nbad+1));
% %                 if i1==1 && (i2==3 || i2==4)
% %                     psi2=-psi2;
% %                 end
% %                 if i1==2 && (i2==1 || i2==2 || i2==4)
% %                     psi2=-psi2;
% %                 end
% %                 if i1==3 && (i2==2  || i2==4)
% %                     psi2=-psi2;
% %                 end
% %                 if i1==4 &&(  i2==3 ||i2==4 )
% %                     psi2=-psi2;
% %                 end
        dom_ov(i1,i2).psibad=psi1;
        dom_ov(i1,i2).Nbad=Nbad;
        dom_ov(i1,i2).lambda=lambda;

        
        
    end
end

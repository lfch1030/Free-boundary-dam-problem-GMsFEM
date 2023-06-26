function w=datadirnew(u,dom,Nx,Ny)
w=0*u;


% for i1=1:Nx
%     for i2=1:Ny
%     Igfree=dom(i1,i2).Igfree;
%     Ig=dom(i1,i2).Ig;
%     v=dom(i1,i2).v;
%     du=solution(v(:,1),v(:,2));
%     w(Ig)=du;
%     w(Igfree)=0;
%     
%     end
% end
scl=0;
for i1=1
    for i2=1:Ny
    M=dom(i1,i2).M;
    left=dom(i1,i2).B.left;
    v=dom(i1,i2).v;
    coeff=1./dom(i1,i2).coeff;
    coeff=sqrt(coeff);
    nel=size(left,1);
    for e=1:nel
        T=M(left(e),:);
          scl=scl+coeff(left(e))*( v(T(3),2)-v(T(1),2));
    end

    end
end


for i1=1
    suml=0;
    for i2=1:Ny
    left=dom(i1,i2).B.left;
    M=dom(i1,i2).M;
    v=dom(i1,i2).v;
    Ig=dom(i1,i2).Ig;
    coeff=1./dom(i1,i2).coeff;
    coeff=sqrt(coeff);
    nel=size(left,1);
    for e=1:nel
        T=M(left(e),:);
        w(Ig(T(1)))=suml/scl;
        suml=suml+coeff(left(e))*( v(T(3),2)-v(T(1),2));
        w(Ig(T(3)))=suml/scl;
    end
    
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scr=0;
for i1=Nx
    for i2=1:Ny
    M=dom(i1,i2).M;
    right=dom(i1,i2).B.right;
    coeff=1./dom(i1,i2).coeff;
    coeff=sqrt(coeff);
    v=dom(i1,i2).v;
    nel=size(right,1);
    for e=1:nel
        T=M(right(e),:);
          scr=scr+coeff(right(e))*( v(T(3),2)-v(T(2),2));
    end
    end
end


for i1=Nx
    sumr=0;
    for i2=1:Ny
    right=dom(i1,i2).B.right;
    M=dom(i1,i2).M;
    v=dom(i1,i2).v;
    Ig=dom(i1,i2).Ig;
    coeff=1./dom(i1,i2).coeff;
    coeff=sqrt(coeff);
    nel=size(right,1);
    for e=1:nel
        T=M(right(e),:);
        w(Ig(T(1)))=sumr/scr;
        sumr=sumr+coeff(right(e))*( v(T(3),2)-v(T(1),2));
        w(Ig(T(3)))=sumr/scr;
    end
    
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 scd=0;
 for i1=1:Nx
     for i2=1
     M=dom(i1,i2).M;
     down=dom(i1,i2).B.down;
     coeff=1./dom(i1,i2).coeff;
    coeff=sqrt(coeff);
     v=dom(i1,i2).v;
     nel=size(down,1);
     for e=1:nel
         T=M(down(e),:);
           scd=scd+coeff(down(e))*( v(T(2),1)-v(T(1),1));
     end
     end
 end

sumd=0;
for i1=1:Nx
    for i2=1
    down=dom(i1,i2).B.down;
    M=dom(i1,i2).M;
    v=dom(i1,i2).v;
    Ig=dom(i1,i2).Ig;
    coeff=1./dom(i1,i2).coeff;
    coeff=sqrt(coeff);
    nel=size(down,1);
    for e=1:nel
        T=M(down(e),:);
        w(Ig(T(1)))=sumd/scd;
        sumd=sumd+coeff(down(e))*( v(T(2),2)-v(T(1),2));
        w(Ig(T(2)))=sumd/scd;
    end
    
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scu=0;
for i1=1:Nx
    for i2=Ny
    M=dom(i1,i2).M;
    up=dom(i1,i2).B.up;
    v=dom(i1,i2).v;
    coeff=1./dom(i1,i2).coeff;
    coeff=sqrt(coeff);
    nel=size(up,1);
    for e=1:nel
        T=M(up(e),:);
          scu=scu+coeff(up(e))*( v(T(2),1)-v(T(3),1));
    end
    end
end

sumu=0;
for i1=1:Nx
    for i2=Ny
    up=dom(i1,i2).B.up;
    M=dom(i1,i2).M;
    v=dom(i1,i2).v;
    Ig=dom(i1,i2).Ig;
    coeff=1./dom(i1,i2).coeff;
    coeff=sqrt(coeff);
    nel=size(up,1);
    for e=1:nel
        T=M(up(e),:);
        w(Ig(T(2)))=sumu/scu+suml/scl;
        sumu=sumu+coeff(down(e))*( v(T(2),2)-v(T(3),2));
        w(Ig(T(3)))=sumu/scu+suml/scl;
    end
    
    end
end




plot_vector(w,dom,Nx,Ny)

        
        
        
        
        
        
        
        
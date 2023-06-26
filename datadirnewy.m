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

for i1=1
    suml=0;
    for i2=1:Ny
    left=dom(i1,i2).B.left;
    M=dom(i1,i2).M;
    v=dom(i1,i2).v;
    Ig=dom(i1,i2).Ig;
    coeff=dom(i1,i2).coeff;
    nel=size(left,1);
    for e=1:nel
        T=M(left(e),:);
        w(Ig(T(1)))=suml;
        suml=suml+coeff(left(e))*( v(T(3),1)-v(T(1),1));
        w(Ig(T(3)))=suml;
    end
    
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i1=Nx
    sumr=0;
    for i2=1:Ny
    right=dom(i1,i2).B.right;
    M=dom(i1,i2).M;
    v=dom(i1,i2).v;
    Ig=dom(i1,i2).Ig;
    coeff=dom(i1,i2).coeff;
    nel=size(right,1);
    for e=1:nel
        T=M(right(e),:);
        w(Ig(T(1)))=sumr;
        sumr=sumr+coeff(right(e))*( v(T(3),1)-v(T(1),1));
        w(Ig(T(3)))=sumr;
    end
    
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sumd=0;
for i1=1:Nx
    for i2=1
    down=dom(i1,i2).B.down;
    M=dom(i1,i2).M;
    v=dom(i1,i2).v;
    Ig=dom(i1,i2).Ig;
    coeff=dom(i1,i2).coeff;
    nel=size(down,1);
    for e=1:nel
        T=M(down(e),:);
        w(Ig(T(1)))=sumd;
        sumd=sumd+coeff(down(e))*( v(T(2),1)-v(T(1),1));
        w(Ig(T(2)))=sumd;
    end
    
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sumu=0;
for i1=1:Nx
    for i2=Ny
    up=dom(i1,i2).B.up;
    M=dom(i1,i2).M;
    v=dom(i1,i2).v;
    Ig=dom(i1,i2).Ig;
    coeff=dom(i1,i2).coeff;
    nel=size(up,1);
    for e=1:nel
        T=M(up(e),:);
        w(Ig(T(1)))=sumu+suml;
        sumu=sumu+coeff(down(e))*( v(T(2),1)-v(T(3),1));
        w(Ig(T(2)))=sumu+suml;
    end
    
    end
end




plot_vector(w,dom,Nx,Ny)

        
        
        
        
        
        
        
        
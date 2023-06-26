function [dom,b,Q]=localseting(ax,bx,ay,by,Nx,Ny,nx,ny,ov)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function


hx=(bx-ax)/(Nx*nx);
hy=(by-ay)/(Ny*ny);

Hx=(bx-ax)/Nx;
Hy=(by-ay)/Ny;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Setting mesh \n');

intx=[ax,bx];
inty=[ay,by];
for i1=1:Nx
    for i2=1:Ny
        intx=[ax+(i1-1)*(bx-ax)/Nx-ov*hx*(i1>1),ax+(i1)*(bx-ax)/Nx+ov*hx*(i1<Nx)];
        inty=[ay+(i2-1)*(by-ay)/Ny-ov*hy*(i2>1),ay+(i2)*(by-ay)/Ny+ov*hy*(i2<Nx)];
        [M,B,v,mesh,h,Ig]=createmeshAS(nx+ov+ov*(i1>1)*(i1<Nx),ny+ov+ov*(i2<Ny)*(i2>1),intx,inty,Nx,Ny);
        dom(i1,i2).M=M;
        dom(i1,i2).B=B;
        dom(i1,i2).v=v;
        dom(i1,i2).mesh=mesh;
        dom(i1,i2).h=h;
        Ig
        pause
        dom(i1,i2).Ig=Ig;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
bar=weitbar(0,'wait')
for i1=1:Nx
    for i2=1:Ny
        waitbar((i1+i2*(Ny-1))/Nx*Ny,bar)
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        mesh=dom(i1,i2).mesh;
        B=dom(i1,i2).B;
        [Asd,bsd]=Nmatrix(M,v,mesh);
        full(Asd)
        pause
        dom(i1,i2).A=Asd;
        dom(i1,i2).b=bsd;
    end
end
clear M B v mesh nx ny intx inty
clear Asd bsd
close bar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % % fprintf('Assambling Matrices \n');
% % % 
% % % 
% % % [A,b]=Nmatrix(M,v,mesh);
% % % 
% % % 
% % % 
% % % upT=B.up;
% % % upv=M(upT,[2,3]);
% % % upv=unique(upv(:));
% % % 
% % % leftT=B.left;
% % % leftv=M(leftT,[1,3]);
% % % leftv=unique(leftv(:));
% % % 
% % %  downT=B.down;
% % %  downv=M(downT,[1,2]);
% % %  downv=unique(downv(:));
% % % 
% % %  rightT=B.right;
% % %  rightv=M(rightT,[2,3]);
% % %  rightv=unique(rightv(:));
% % %  
% % %  d=unique([upv,leftv,downv,rightv]);
% % % free=setdiff(1:mesh.nv,d);
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % %%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % u=sparse(mesh.nv,1);
% % % u(free)=A(free,free)\b(free);
% % % 
% % % el2=error_l2(u,M,v,mesh);
% % % eh1=error_h1(u,M,v,mesh);

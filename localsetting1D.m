function [dom,b,nvel]=localsetting1D(ax,bx,Nx,nx,ov)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% values of the arguments before bocoming function


hx=(bx-ax)/(Nx*nx);

Hx=(bx-ax)/Nx;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Setting mesh \n');

intx=[ax,bx];
hbar=waitbar(0,':)');
hbarn=0;
for i1=1:Nx
        hbarn=hbarn+1;
        waitbar(hbarn/(Nx),hbar);
        intx=[ax+(i1-1)*(bx-ax)/Nx,ax+(i1)*(bx-ax)/Nx];
        [M,B,v,mesh,h,Ig]=createmeshAS1D(nx,intx,Nx,i1);
        dom(i1).M=M;
        dom(i1).B=B;
        dom(i1).v=v;
        dom(i1).mesh=mesh;
        dom(i1).h=h;
        dom(i1).Ig=Ig;
end
close(hbar)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
nvel=(Nx*nx+1);
b=sparse(nvel,1);
hbarn=0;
hbar=waitbar(0,':)');
for i1=1:Nx
        hbarn=hbarn+1;
        waitbar(hbarn/(Nx),hbar)
        M=dom(i1).M;
        v=dom(i1).v;
        mesh=dom(i1).mesh;
        [Asd,bsd]=Nmatrix1D(M,v,mesh);
        dom(i1).A=Asd;
        dom(i1).b=bsd;
        colI=dom(i1).Ig;
        b(colI)=b(colI)+bsd;
end
close(hbar)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% % fprintf('Assambling Global Right Hand Side \n');
% % nvel=(Nx*nx+1)*(Ny*ny+1);
% % b=sparse(nvel,1);
% % %plot_vector(b,dom,Nx,Ny)
% %  for i1=1:Nx
% %     for i2=1:Ny
% %         colI=dom(i1,i2).Igfree;
% %         freel=dom(i1,i2).free;
% %         b(colI)=b(colI)+dom(i1,i2).b(freel);
% % %        plot_vector(b,dom,Nx,Ny)
% % %        pause
% %     end
% % end



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

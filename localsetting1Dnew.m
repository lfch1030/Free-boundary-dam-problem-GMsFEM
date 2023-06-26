function [dom,b,nvel]=localsetting1Dnew(dom,Nx,nx)

nvel=(Nx*nx+1);
b=sparse(nvel,1);
hbarn=0;
hbar=waitbar(0,':)');
for i1=1:Nx
        hbarn=hbarn+1;
        waitbar(hbarn/(Nx),hbar)
        M=dom(i1).M;
        vnew=dom(i1).vnew;
        mesh=dom(i1).mesh;
        coeff=dom(i1).coeff;
        [Asd,bsd]=Nmatrix1Dnew(M,vnew,mesh,coeff);
        dom(i1).Anew=Asd;
        dom(i1).bnew=bsd;
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

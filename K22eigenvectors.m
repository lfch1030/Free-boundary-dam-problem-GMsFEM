%[dom_ov3,nvel_ov3]=localsetting_ov(ax,bx,ay,by,Nx,Ny,nx,ny,nx,mu,k1perm);
% % % % % dom_ov=localeigenvectors(b,dom_ov, Nx,Ny);
% % % % % 
% % % % % for i1=1:Nx-1
% % % % %     for i2=1:Ny-1
% % % % %         LK22(i1,i2)=dom_ov(i1,i2).lambda(2);
% % % % %     end
% % % % % end
% % % % % 
% % % % % 
% % % % % for i1=1:Nx-1
% % % % %     for i2=1:Ny-1
% % % % %         L3K22(i1,i2)=dom_ov(i1,i2).lambda(3);
% % % % %     end
% % % % % end

for i1=1:Nx-1
    for i2=1:Ny-1
        L4K22(i1,i2)=dom_ov(i1,i2).lambda(4);
    end
end


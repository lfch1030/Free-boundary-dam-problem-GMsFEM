

for i=1:9
figure(1)
subplot(3,3,i)
x2=apply_R0BADB_T(Q(:,i),dom_ov,Nx,Ny);
plot_vector(x2, dom,Nx,Ny,mu,k'); view(2); shading flat; colorbar;
title(2)

xf2=Qfull(:,i);

figure(2)
subplot(3,3,i)
plot_vector(xf2, dom,Nx,Ny,mu,k');  view(2); shading flat;  colorbar
pause(0.2)
end
% figure
% x10=apply_R0BADB_T(Q(:,10),dom_ov,Nx,Ny);
% plot_vector(x10, dom,Nx,Ny,mu,k')
% title(10)
% figure
% x20=apply_R0BADB_T(Q(:,20),dom_ov,Nx,Ny);
% plot_vector(x20, dom,Nx,Ny,mu,k')
% title(20)
% figure
% x30=apply_R0BADB_T(Q(:,30),dom_ov,Nx,Ny);
% plot_vector(x30, dom,Nx,Ny,mu,k')
% title(30)
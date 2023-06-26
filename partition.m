tx=x*0;
%Oxi=-nt/10;
Oxi=xp;
rhstotal=0*xp;
rhstotal2=0*xp;
rhstotal3=0*xp;
rhstotalGG=0*xp;
rhstotalGI=0*xp;

for i1=1:Nx-1
    for i2=1:Ny-1

xi=applay_AI_inv(Oxi,dom_ov,i1,i2);
%xi=dom_ov(i1,i2).philin;
plot_vector(xi,dom,Nx,Ny);
title('basis')
pause(0.2)
hold off
Axi=applay_A(xi,dom,Nx,Ny);
AIxi=applay_A_I(xi,dom_ov,i1,i2);
AGGxi_loc=applay_AGG(xi,dom,Nx,Ny);
AGIxi_loc=applay_AGI(xi,dom,Nx,Ny);
wI=applay_AGG_local(vones,dom_ov,i1,i2)+applay_AGI_local(vones,dom_ov,i1,i2);
rhstotalGG=rhstotalGG+AGGxi_loc;
rhstotalGI=rhstotalGI+AGIxi_loc;
rhstotal3=AIxi+rhstotal3;
plot_vector(Axi,dom,Nx,Ny);
title('Aphi_i')
pause(0.2)
hold off
% plot_vector(AGIxi,dom,Nx,Ny);
% title('AGIphi_i')
% pause(0.2)
% hold off
% plot_vector(Axi2-Axi,dom,Nx,Ny);
% title('diff')
% pause(0.2)
% hold off
% plot_vector(wI,dom,Nx,Ny);
% title('wI')
% %pause(0.2)(0.2)
% hold off
%tx=tx+xi;        
    end
end

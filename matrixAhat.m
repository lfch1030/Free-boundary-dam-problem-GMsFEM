LT=961;
L=50;
AL=A*0;
ML=AL;
for l=1:L
    phil=Qfull(:,l);
    Mphil=applay_M(phil,dom,Nx,Ny);
    lambdal=lambdafull(l);
%    blf=dot(phif,bnew);
%    nv(l)=blf^2/lf;
    Al=(Mphil)*lambdal*(Mphil');
    Ml=Mphil*(Mphil');
%    whos ulf 
%     pause
%     plot_vector(abs(ulf), dom,Nx,Ny,mu,k');
%     pause(.2)
%     hold off
 AL=AL+Al;
 ML=ML+Ml;
end
Ahat=A-AL;
Mhat=M-ML;
 
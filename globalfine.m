L=7; LT=961;

uhLf=0*bnew;
uhLc=0*bnew;
for l=2:L
    phif=Qfull(:,l);
    phic=apply_R0BADB_T(Q(:,l),dom_ov,Nx,Ny);

    lf=lambdafull(l);
    blf=dot(phif,bnew);
    ulf=(blf/lf)*phif;
    
    lc=lambda(l);
    blc=dot(phic,bnew);
    ulc=(blc/lc)*phic;
    
    uhLf=uhLf+ulf;
    uhLc=uhLc+ulc;
end

AuhLf= applay_AN(uhLf,dom,Nx,Ny);
e=uhLf-uhLc;
Ae= applay_AN(e,dom,Nx,Ny);
egf=dot(e,Ae)/dot(uhLf,AuhLf);




uALL=0*bnew;
for l=2:LT
    phif=Qfull(:,l);

    lf=lambdafull(l);
    blf=dot(phif,bnew);
    nv(l)=blf^2/lf;
    ulf=(blf/lf)*phif;
%     pause
%     plot_vector(abs(ulf), dom,Nx,Ny,mu,k');
%     pause(.2)
%     hold off
    
    uALL=uALL+ulf;

end


eALL=uhLf-uALL;
AeALL= applay_AN(eALL,dom,Nx,Ny);
AuALL= applay_AN(uALL,dom,Nx,Ny);
egfALL=dot(eALL,AeALL)/dot(uALL,AuALL);


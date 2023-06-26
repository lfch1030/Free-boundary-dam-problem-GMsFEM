i1=6; i2=2;
firstphi=0*b;
Nbadr=dom_ov(i1,i2).Nbadr;
for l=1:Nbadr
    figure(10+l)
%    figure(1)
    subplot(1,2,1)
%     plot_vector_I(dom_ov(i1,i2).psibad(:,l), dom_ov,i1,i2,mu,k');
%     firstphi=firstphi+Q(l,3)*dom_ov(i1,i2).cbbadms(l).phi;
%    figure(2) 
    subplot(1,2,2)
     plot_vector_I(dom_ov(i1,i2).cbbadmsr(l).phi, dom_ov,i1,i2,mu,k');
%    plot_mesh(dom,Nx,Ny)
end

%figure
figure
%subplot(2,2,4)
%plot_vector_I(dom_ov(i1,i2).psibad(:,Nbad+1), dom_ov,i1,i2,mu,k');
plot_vector_I(dom_ov(i1,i2).phiEM, dom_ov,i1,i2,mu,k');

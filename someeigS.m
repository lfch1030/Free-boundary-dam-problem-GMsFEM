GT=interfaceN_index(dom,Nx,Ny);

for i=1:100
%subplot(2,3,i-1)
%figure(i)
psi=0*b;
psi(GT)=Q(:,i);
psiI=extent_to_int(psi,b*0,dom,Nx,Ny);
plot_vector(psi+psiI, dom,Nx,Ny,mu,[])
%shading interp
title(['i=',num2str(i),' and \lambda=',num2str(lambda(i)),])
pause
hold off
end

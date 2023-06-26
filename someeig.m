for i=1:126
%subplot(2,3,i-1)
%figure(i)
plot_vector(Q(:,i), dom,Nx,Ny,mu,[]);title(i)
title(['i=',num2str(i),' and \lambda=',num2str(lambda(i)),])
pause
hold off
end
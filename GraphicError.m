
f5=figure
plot(Matrix_error(:,1),Matrix_error(:,2), '^-','LineWidth',1.8)
hold on;
plot(Matrix_error(:,1),Matrix_error(:,3), 'o-','LineWidth',1.5)
hold on;
plot(Matrix_error(:,1),Matrix_error(:,4), 's-','LineWidth',1.5)
hold on;
plot(Matrix_error(:,1),Matrix_error(:,5), 'p-','LineWidth',1.5)
grid on
grid minor
legend('L_w^2 error (p)','H_w^1 error (p)','L_w^2 error (Sat)','H_w^1 error (Sat)','latex','FontSize',12)
title('Relative error for presure and saturation','Interpreter','latex','FontSize',12)
xlabel('Number of multiscale basis on each neighborhood')
ylabel('Error')
f5.Position=[0 0 400 300];
xticks(Matrix_error(:,1))
exportgraphics(f5,['figure\p&theta_Err_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),'.pdf'],'ContentType','vector')

f6=figure
plot(Matrix_error(:,1),Matrix_error(:,2), '^-','LineWidth',2)
hold on;
plot(Matrix_error(:,1),Matrix_error(:,3), 'o-','LineWidth',2)
hold on;
grid on;
grid minor;
legend('$L_w^2$ error ($p$)','$H_w^1$ error ($p$)','Interpreter','latex','FontSize',12)
title('Relative error for presure','Interpreter','latex','FontSize',12)
xlabel('Number of multiscale basis on each neighborhood','Interpreter','latex')
ylabel('Error','Interpreter','latex')
f6.Position=[0 0 400 300];
xticks(Matrix_error(:,1))
exportgraphics(f6,['figure\p_Err_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),'.pdf'],'ContentType','vector')
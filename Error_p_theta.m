Exact_t=theta_fine;
Exact_p=p_fine;
p_error=abs(p_coarse-p_fine);
theta_error=abs(theta_coarse-theta_fine);

L2_error_p=sqrt((p_error'*opO*p_error)/(Exact_p'*opO*Exact_p))*100;
L2_error_theta=sqrt((theta_error'*opO*theta_error)/(Exact_t'*opO*Exact_t))*100;

H1_error_p=sqrt((p_error'*A*p_error)/(Exact_p'*A*Exact_p))*100;
H1_error_theta=sqrt((theta_error'*A*theta_error)/(Exact_t'*A*Exact_t))*100;

Matrix_error=full([Matrix_error ; round(add+1),L2_error_p,H1_error_p,L2_error_theta,H1_error_theta])

Ratio_Error=1./(Matrix_error(2:end,:)./Matrix_error(1:end-1,:))


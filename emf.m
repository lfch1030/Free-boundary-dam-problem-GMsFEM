function [dom_ov,iter]=emf(dom,dom_ov,Nx,Ny,b,mu,k1perm)


max_it=2000;
tol=1e-10;

vones=createone(b,dom,Nx,Ny);
%xaux = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
[xaux, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);

for i1=1:Nx-1
    for i2=1:Ny-1
        dom_ov(i1,i2).phiEM=applay_AI_inv(xaux,dom_ov,i1,i2);
%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end

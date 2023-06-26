function dom_ov=emfgenpu(dom,dom_ov,Nx,Ny,b,mu,u)



vones=u;
%xaux = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%[xaux, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);

for i1=1:Nx-1
    for i2=1:Ny-1
        philin=dom_ov(i1,i2).philin;
        dom_ov(i1,i2).phiEM2PU=philin.*u;
%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end

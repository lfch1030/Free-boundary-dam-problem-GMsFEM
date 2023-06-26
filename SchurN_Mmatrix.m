function S=SchurN_Mmatrix(dom,Nx,Ny,b)

GT=interfaceN_index(dom,Nx,Ny);
nvar=size(GT,2);
S=sparse(nvar,nvar);
hbar=waitbar(0,':(');
counter=0;
for bf1=1:nvar
for bf2=1:nvar
    counter=counter+1;
    waitbar(counter/(nvar^2),hbar);
    x1=b*0;
     x2=b*0;
    x1(GT(bf1))=1;
    x2(GT(bf2))=1;
   x1I=extent_to_int(x1,b*0,dom,Nx,Ny);
   Mx1=applay_M(x1I+x1,dom,Nx,Ny);
   x2I=extent_to_int(x2,b*0,dom,Nx,Ny);

% % %     plot_vector(Sx1,dom,Nx,Ny);
% % %     pause(0.1)
% % %     hold off
%    sol=x1+uI;
    S(bf1,bf2)=dot(x2I+x2,Mx1);
end
end    
close(hbar)

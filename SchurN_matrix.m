function S=SchurN_matrix(dom,Nx,Ny,b)

GT=interfaceN_index(dom,Nx,Ny);
nvar=size(GT,2);
S=sparse(nvar,nvar);
hbar=waitbar(0,':(');
counter=0;
for bf1=1:nvar
%for bf2=1:nvar
    counter=counter+1;
    waitbar(counter/nvar,hbar);
    x1=b*0;
%     x2=b*0;
    x1(GT(bf1))=1;
%    x2(GT(bf1))=1;
    Sx1=applay_SN(x1,dom,Nx,Ny);
% % %     plot_vector(Sx1,dom,Nx,Ny);
% % %     pause(0.1)
% % %     hold off
%    sol=x1+uI;
    S(bf1,:)=Sx1(GT);
end
    
close(hbar)

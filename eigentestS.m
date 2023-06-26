exp2;
S=SchurN_matrix(dom,Nx,Ny,b);
%MS=SchurN_Mmatrix(dom,Nx,Ny,b);

% AD=assam_matrixAD(x2L,dom,Nx,Ny);
%  M=assam_matrixM(x2L,dom,Nx,Ny);
% 
%[Q,D]=eig(full(A));
 [Q,D]=eig(full(S));
% [QD,DD]=eig(full(AD),full(M));
% [lambdaD,ID]=sort(diag(DD),'ascend');
% QD=QD(ID,ID);
 [lambda,I]=sort(diag(D),'ascend');
 Q=Q(I,I);
 

 
 % 
% M0=coarse_matrixM(dom,dom_ov,Nx,Ny);
% M0MS=coarse_matrixM_MS(dom,dom_ov,Nx,Ny);
% M0EMF=coarse_matrixM_EMF(dom,dom_ov,Nx,Ny);
% 

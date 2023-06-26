%exp1;
%A=full(A02C);%assam_matrixA(x2L,dom,Nx,Ny);

% AD=assam_matrixAD(x2L,dom,Nx,Ny);
% M=M0;%assam_matrixM(x2L,dom,Nx,Ny);
% 
% %[Q,D]=eig(full(A));
[Q,D]=eig(full(A02C),full(M0));
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
% 
%K11eigenvectors
%K22eigenvectors
%K33eigenvectors

% [Q0,D0]=eig(full(A0),full(M0));
% [lambda0,I0]=sort(diag(D0),'ascend');
% Q0=Q0(I0,I0);
% 
% [Q0MS,D0MS]=eig(full(A0MS),full(M0MS));
% [lambda0MS,I0MS]=sort(diag(D0MS),'ascend');
% Q0MS=Q0MS(I0MS,I0MS);
% 
% [Q0EMF,D0EMF]=eig(full(A0EMF),full(M0EMF));
% [lambda0EMF,I0EMF]=sort(diag(D0EMF),'ascend');
% Q0EMF=Q0EMF(I0EMF,I0EMF);
% 

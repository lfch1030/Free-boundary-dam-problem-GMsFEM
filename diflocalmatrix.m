function diff=diflocalmatrix(M,v,w,mesh)

% fprintf('Creating Sparse Matrices in subdomain \n');

% Cuadrature points in the reference triangle (See Braess)
%[xi,eta,omega]=setquadrature();


nvel=mesh.nv; % velocity degrees of freedom==number of vertices.
A=sparse(nvel,nvel);   % grad*grad   
b=sparse(nvel,1);       % right hand side part --->.
%Mul=sparse(npre,1);        % Lagrange multimplier to ensure zero pressure.


diff=0;
% odd loop
% h= waitbar(0,'Please wait...assambling stiffness');
for i=1:2:mesh.ne
%   waitbar(i/(2*mesh_f.ne),h)
    %%%%%%%%%%%%%%%%%%  GLOBAL NUMBERING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lcol=M(i,:); % subdomain indexes of bases.
    %%%%%%%%%%%%%%%%%%% VELOCITY*VLOCITY STIFNESS %%%%%%%%%%%%%%%%%%%%%
    lAalpha=localA(M(i,:),v); % compute local part of A
    lA=localAlaplacian(M(i,:),w); % compute local part of A
    diff=diff+norm(lAalpha-lA,'fro')^2;
end

for i=2:2:mesh.ne
%   waitbar((i+mesh_f.ne)/(2*mesh_f.ne),h)
    %%%%%%%%%%%%%%%%%%  GLOBAL NUMBERING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lcol=M(i,:);
     %%%%%%%%%%%%%%%%%%% VELOCITY*VLOCITY STIFNESS %%%%%%%%%%%%%%%%%%%%%
    lAalpha=localA(M(i,:),v); % compute local part of A
    lA=localAlaplacian(M(i,:),w); % compute local part of A
    diff=diff+norm(lAalpha-lA,'fro')^2;
end

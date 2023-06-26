function A=Bmatrixleft(M,v,mesh,Boundary,mu,k1perm)

% fprintf('Creating Sparse Matrices in subdomain \n');

% Cuadrature points in the reference triangle (See Braess)
%[xi,eta,omega]=setquadrature();


nvel=mesh.nv; % velocity degrees of freedom==number of vertices.
A=sparse(nvel,nvel);   % grad*grad   

%Mul=sparse(npre,1);        % Lagrange multimplier to ensure zero pressure.

% odd loop
% h= waitbar(0,'Please wait...assambling stiffness');
for i=1:length(Boundary.left)
%   waitbar(i/(2*mesh_f.ne),h)
    %%%%%%%%%%%%%%%%%%  GLOBAL NUMBERING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lcol=M(Boundary.left(i),:); % subdomain indexes of bases.
    %%%%%%%%%%%%%%%%%%% VELOCITY*VLOCITY STIFNESS %%%%%%%%%%%%%%%%%%%%%
    lA=localBleft(M(i,:),v,mu,k1perm); % compute local part of A
    A(lcol,lcol)=A(lcol,lcol)+lA;
    %%%%%%%%%%%%%%%%%%%%%%% LAGRANGE MULTIPLIER %%%%%%%%%%%%%%%%%%%%%%%
    %Mul(M_f(i,:),1)=Mul(M_f(i,:),1)+localmul(M_f(i,:),v_f,mesh_f,xi,eta,omega);
end



function b=piecewiselocal2D(M,v,mesh,mu,k1perm)

% fprintf('Creating Sparse Matrices in subdomain \n');

% Cuadrature points in the reference triangle (See Braess)
%[xi,eta,omega]=setquadrature();


nvel=mesh.ne; % velocity degrees of freedom==number of vertices.
b=sparse(nvel,1);       % right hand side part --->.
%Mul=sparse(npre,1);        % Lagrange multimplier to ensure zero pressure.

% odd loop
% h= waitbar(0,'Please wait...assambling stiffness');
for i=1:mesh.ne
%   waitbar(i/(2*mesh_f.ne),h)
    %%%%%%%%%%%%%%%%%%  GLOBAL NUMBERING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%% VELOCITY*VLOCITY STIFNESS %%%%%%%%%%%%%%%%%%%%%
    lb=localcoeff_M2D(M(i,:),v,mu,k1perm);
    b(i)=lb;
    %%%%%%%%%%%%%%%%%%%%%%% LAGRANGE MULTIPLIER %%%%%%%%%%%%%%%%%%%%%%%
    %Mul(M_f(i,:),1)=Mul(M_f(i,:),1)+localmul(M_f(i,:),v_f,mesh_f,xi,eta,omega);
end


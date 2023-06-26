function [x, error, iter, flag]=gmresdam(x, b,br, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0,d0,deltat,N0left,N0right,restrt)

%  -- Iterative template routine --
%     Univ. of Tennessee and Oak Ridge National Laboratory
%     October 1, 1993
%     Details of this algorithm are described in "Templates for the
%     Solution of Linear Systems: Building Blocks for Iterative
%     Methods", Barrett, Berry, Chan, Demmel, Donato, Dongarra,
%     Eijkhout, Pozo, Romine, and van der Vorst, SIAM Publications,restrt,max_it,tol)
%     1993. (ftp netlib2.cs.utk.edu; cd linalg; get templates.ps).
%
% [x_g, x_p0, error, iter, flag]=gmres_bnn_stokes(mesh, system, K, B0_t, B0, C_gg , x_g, x_p0, b_g, b_p0,restrt,max_it,tol)
% 
%
% gmres.m solves the linear system Ax=b
% using the Generalized Minimal residual ( GMRESm ) method with restarts 
% and balacing preconditioning for stokes.
%
% input   mesh     mesh data structure
%         system   data structure for the coarse variables and local
%         problems
%         K        matrix of velocity and pressure with zero average on
%         each subdomain
%         B0_t , B0  matrices of pressure with zero average.
%         C_gg     matrix of pressure with zero average : p x q
%         x_g      REAL initial guess vector of global size
%         x_p0     REAL initial guess vector of pressure with zero average.
%         b_g      REAL right hand side vector (global size)
%         b_p0     REAL right hand side vector of pressure with zero aver.
%         
%         restrt   INTEGER number of iterations between restarts
%         max_it   INTEGER maximum number of iterations
%         tol      REAL error tolerance
%
% output  x_g      REAL global size... solution vector on gamma (vels.)
%         x_p0     REAL pressures constant in each subdomain.
%         error    REAL error norm
%         iter     INTEGER number of iterations performed
%         flag     INTEGER: 0 = solution found to tolerance
%                           1 = no convergence given max_it

   
iter = 0;                                         % initialization
flag = 0;

   

bnrm2 = norm( b );
if  ( bnrm2 == 0.0 ), bnrm2 = 1.0; end

%%%%%% COMPUTES :   r = M \ ( b-A*x );
  Ax=applay_A(x,dom,Nx,Ny)+(0.5/deltat)*applay_M(x,dom,Nx,Ny)+0.5*apply_O1(x,dom,Nx,Ny,N0left,N0right)+0.5*apply_O2(x,dom,Nx,Ny,N0left,N0right);
  Ax=applay_ZeroDir(Ax,dom,Nx,Ny);

%  r=0*b;
  r1 = b -Ax;
   zlocal  = applay_Aadd_inv(r1,dom,dom_ov,Nx,Ny);
   z0=apply_P0BAD(r1,dom_ov,Nx,Ny,A0,d0);
  r=zlocal;+z0; %r=pc(r1)
  r=zerodir(r,dom,Nx,Ny);
%  r=r1;
   
fprintf(' Left preconditioned GMRES residual(0) = %g\n',norm( r ))
error = norm( r ) / bnrm2;
if ( error < tol ) return, end

%%%%%%% [n,n] = size(A);                                  % initialize workspace
n = length(b);
   
m = restrt;
V(1:n,1:m+1) = zeros(n,m+1);
H(1:m+1,1:m) = zeros(m+1,m);
HH = zeros(m+1,m);
cs(1:m) = zeros(m,1);
sn(1:m) = zeros(m,1);
e1    = zeros(n,1);
e1(1) = 1.0;


   
for iter = 1:max_it,                              % begin iteration
    fprintf(' iter=%d\n',iter)  % THE RESTARTING ITERATION
    
    %     r = M \ ( b-A*x );
    %%%%%%%%%%  COMPUTES  :  r = pc( b-A*x );
     Ax=applay_A(x,dom,Nx,Ny)+(0.5/deltat)*applay_M(x,dom,Nx,Ny)+0.5*apply_O1(x,dom,Nx,Ny,N0left,N0right)+0.5*apply_O2(x,dom,Nx,Ny,N0left,N0right);
  Ax=applay_ZeroDir(Ax,dom,Nx,Ny);

%  r=0*b;
  r1 = b -Ax;
%        rlocal  = applay_Aadd_inv(r,dom,dom_ov,Nx,Ny);
   zlocal  = applay_Aadd_inv(r1,dom,dom_ov,Nx,Ny);
   z0=apply_P0BAD(r1,dom_ov,Nx,Ny,A0,d0);
  r=zlocal;+z0; %r=pc(r1)
 % r=r1;
  
  r=zerodir(r,dom,Nx,Ny);
      
    V(:,1) = r / norm( r );
    s = norm( r )*e1;
    for i = 1:m,                % construct orthonormal
        
        %	 COMPUTES :  w = M \ (A*V(:,i));                             % basis using Gram-Schmidt
         
        Viaux= V(:, i);
        AViaux=applay_A(Viaux,dom,Nx,Ny)+(0.5/deltat)*applay_M(Viaux,dom,Nx,Ny)+0.5*apply_O1(Viaux,dom,Nx,Ny,N0left,N0right)+0.5*apply_O2(Viaux,dom,Nx,Ny,N0left,N0right);

           w1 = applay_Aadd_inv(AViaux,dom,dom_ov,Nx,Ny);
   w0=apply_P0BAD(AViaux,dom_ov,Nx,Ny,A0,d0);
            w=w1;+w0;
           
  %      w =AViaux ;%%%%%%% %w = pc(A*V(:,i)); 
        % basis using Gram-Schmidt
        
        for k = 1:i,
            H(k,i)= w'*V(:,k);
            HH(k,i) = H(k,i);
            w = w - H(k,i)*V(:,k);
        end
        H(i+1,i) = norm( w );
        HH(i+1,i) = H(i+1,i);
        V(:,i+1) = w / H(i+1,i);
        
        for k = 1:i-1,                              % apply Givens rotation
            temp     =  cs(k)*H(k,i) + sn(k)*H(k+1,i);
            H(k+1,i) = -sn(k)*H(k,i) + cs(k)*H(k+1,i);
            H(k,i)   = temp;
        end
        [cs(i),sn(i)] = rotmat( H(i,i), H(i+1,i) ); % form i-th rotation matrix
        temp   = cs(i)*s(i);                        % approximate residual norm
        s(i+1) = -sn(i)*s(i);
        s(i)   = temp;
        H(i,i) = cs(i)*H(i,i) + sn(i)*H(i+1,i);
         
        H(i+1,i) = 0.0;
          
        error  = abs(s(i+1)) / bnrm2;
%e        fprintf('(**2)Left preconditioned GMRES residual(%d) = %g\n',i,error)
        if ( error <= tol ),                        % update approximation
            y = H(1:i,1:i) \ s(1:i);                 % and exit
            x = x + V(:,1:i)*y;
            break;
        end

    end
    fprintf('(**3)Left preconditioned GMRES residual(%d) = %g\n',iter,error)

    if ( error <= tol ), break, end
    y = H(1:m,1:m) \ s(1:m);
    x = x + V(:,1:m)*y;                            % update approximation
    
    %     r = M \ ( b-A*x )                              % compute residual
    
    
    % COMPUTES r = pc( b-A*x)   ( THE RESIDUAL)
  Ax=applay_A(x,dom,Nx,Ny)+(0.5/deltat)*applay_M(x,dom,Nx,Ny)+0.5*apply_O1(x,dom,Nx,Ny,N0left,N0right)+0.5*apply_O2(x,dom,Nx,Ny,N0left,N0right);
  Ax=applay_ZeroDir(Ax,dom,Nx,Ny);

%  r=0*b;
  r1 = b -Ax;
  r=r1;

    %%%%%%%%%%%%%%%%%
    s(i+1) = norm(r);
    error = s(i+1) / bnrm2;                        % check convergence
    fprintf(' Left preconditioned GMRES residual(%d) = %g\n',iter,error)
    if ( error <= tol ), break, end;
   
end

if ( error > tol ) flag = 1; end;                 % converged

% END of gmres.m




M = HH(1:i, 1:i);
a = eig(M);
cond = max(a)/min(a);
fprintf('##########################################################\n');
fprintf('##########  EXTREME EIGENVALUES AND CONDITION  ###########\n');
fprintf('##########################################################\n');
fprintf('###  Maximum Eigenvalue of Hessenber Matrix: %.5e\n',  max(a) );
fprintf('###  Minimum Eigenvalue of Hessenber Matrix: %.5e \n',  min(a));
fprintf('###  Condition = %.5e\n', cond);
fprintf('##########################################################\n');

%  END of gmres.m
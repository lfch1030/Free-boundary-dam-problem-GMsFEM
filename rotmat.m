   function [ c, s ] = rotmat( a, b )
%
% Compute the Givens rotation matrix parameters for a and b.
%
   gam = 1.0/sqrt( conj(a)*a + conj(b)*b );
   c   = a * gam;
   s   = b * gam; 

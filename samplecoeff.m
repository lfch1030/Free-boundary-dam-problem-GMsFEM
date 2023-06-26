mu=10^5;

newperm1 % this generates matrix with coefficeint values
%other scripts:
%newperm1before
%newperm1forglobal
%newperm1ni
%newperm2
%newperm2_2
%newperm2_2msdg
%newperm2_cross2
%newperm3
%newperm3
%newperm560
%newperm6
%nnewperm5

 k1perm=k'; % transpose of generated matrix.
x=0.5;
y=0.5;
value=coeficient(x,y,mu,k1perm); % due to some previous experiments 
% i need to pass mu as argument, this is no longer necesary but matlab 
% code still requires this
% coefficeints only receive arguments 0<x<1, 0<y<1.
value
imagesc(k1perm)
function e=f2to1(ix,iy,nex,ney)
nvx=nex+1;
nvy=ney+1;
% i(1)=mod(ne,nvy);
% i(2)=1+(ne-i(1))/nvx;

e=nvx*(iy-1)+ ix;
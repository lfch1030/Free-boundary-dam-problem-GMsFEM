function i=f1to2(ne,nex,ney)
nvx=nex+1;
nvy=ney+1;
i(1)=mod(ne,nvy);
i(2)=1+(ne-i(1))/nvx;
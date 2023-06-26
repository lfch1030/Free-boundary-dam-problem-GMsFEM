
xsum=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        xsum=xsum+dom_ov(i1,i2).phiEM;
    end
end

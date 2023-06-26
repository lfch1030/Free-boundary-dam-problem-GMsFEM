
for i1=1:Nx-1
    for i2=1:Ny-1
        badtilde(i1,i2)=dom_ov(i1,i2).Nbadtilde;
        nexttobad(i1,i2)=dom_ov(i1,i2).lambda(badtilde(i1,i2)+1);
    end
end
badtilde=badtilde';
nexttobad=nexttobad';

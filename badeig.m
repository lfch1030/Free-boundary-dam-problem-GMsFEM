
for i1=1:Nx+1
    for i2=1:Ny+1
        bad(i1,i2)=dom_ov(i1,i2).Nbadtilde;
        badr(i1,i2)=dom_ov(i1,i2).Nbadr;
        nexttobad(i1,i2)=dom_ov(i1,i2).lambdatilde(bad(i1,i2)+5);
    end
end
bad=bad';
badr=badr';
nexttobad=nexttobad';

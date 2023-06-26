xTmin=b*0;
for i1=1:Nx-1
    for i2=1:Ny-1
        philin=dom_ov(i1,i2).phimin;
        xTmin=philin+xTmin;
   
    end
end

xTlin=b*0;
for i1=1:Nx-1
    for i2=1:Ny-1
        philin=dom_ov(i1,i2).philin;
        xTlin=philin+xTlin;
   
    end
end

function w=argtranslationup(u,nv,nx,ny,g, deltat)
w=u*0;
for i=1:nv

    ix=mod(i-1,nx+1)+1;
    iy= ((i-ix)/(ny+1))+1;
    
    if (iy>1 )
        jy=iy-1;
        j=(ny+1)*(jy-1)+ix;
        w(i)=u(i)+( u(j)-u(i))*(g*deltat*ny);
    else
        jy=iy;
        j=(ny+1)*(jy-1)+ix;
        w(i)=u(i)+( u(j)-u(i))*(g*deltat*ny);
    end
    
    
end

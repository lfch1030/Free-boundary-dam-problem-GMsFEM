function vec=PCtovector(PC,dom,Nx,Ny)

I=0;
for i1=1:Nx
    for i2=1:Ny
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        %        col=dom(i1,i2).Ig;
        coeff=PC(i1,i2).energy;
        ne=dom(i1,i2).mesh.ne;
        for j=1:ne
            I=I+1;
            vec(I)=coeff(j);
        end
    end
end


function Penergy=piecewisecoeff2Dgrad(x,dom,Nx,Ny)
% function plot_vector(u,dom,Nx,Ny)
color=0;
for i1=1:Nx
    for i2=1:Ny
        color=color+1;
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        %        col=dom(i1,i2).Ig;
        coeff=dom(i1,i2).coeff;
        ne=dom(i1,i2).mesh.ne;
                Ig=dom(i1,i2).Ig;

        for j=1:ne
            color=Ny*(i1-1)+i2;
            absgrad=local_absgrad(M(j,:),v,x(Ig));
            value=coeff(j).*absgrad;
            energy(j)=value;
%            trisurf([1,2,3],v(M(j,:),1),v(M(j,:),2), [value;value;value] );
%            hold on
        end
%            pause(0.001)
     Penergy(i1,i2).energy=energy;
    end
end
% axis square
% shading flat
% view(2)
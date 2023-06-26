function dom=piecewisecoeff(dom,Nx)


for i1=1:Nx
        M=dom(i1).M;
        v=dom(i1).v;
        mesh=dom(i1).mesh;
        coeff=piecewiselocal(M,v,mesh);
        dom(i1).coeff=(1./coeff);
end

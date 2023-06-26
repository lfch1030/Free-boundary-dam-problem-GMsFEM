for i1=1:Nx
    for i2=1:Ny
        M=dom(i1,i2).M;
        v=dom(i1,i2).vnew;
        mesh=dom(i1,i2).mesh;
        free=dom(i1,i2).free;
        
        Asdlap=Nmatrix(M,v,mesh);
        dom(i1,i2).Anew=Asdlap;
    end
end

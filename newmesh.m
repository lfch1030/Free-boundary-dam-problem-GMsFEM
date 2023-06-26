function dom=newmesh(dom,Nx)

last=dom(1).mesh.ax;
for i1=1:Nx
        M=dom(i1).M;
        v=dom(i1).v;
        coeff=dom(i1).coeff;
        mesh=dom(i1).mesh;
        [vnew,lastaux]=newsubdomainmesh(M,v,mesh,coeff,last);
        last=lastaux;
        dom(i1).vnew=vnew;
end

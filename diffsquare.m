function J=diffsquare(cd,dom,Nx,Ny)
ntv=size(cd,1);
c1=cd(1:ntv/2);
d=cd(ntv/2+1:ntv);
c=[c1,d];
J=0;
nv=0;
for i1=1:Nx
    for i2=1:Ny
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        mesh=dom(i1,i2).mesh;
        snv=dom(i1,i2).mesh.nv;
        w=c(nv+1:nv+snv,:);
        nv=nv+snv;
        
        Js=diflocalmatrix(M,v,w,mesh);
%         Js=norm(Aalpha-A,'fro');
        J=J+Js;
        
    end
end
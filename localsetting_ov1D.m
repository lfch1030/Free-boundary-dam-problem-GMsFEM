function [dom,nvel]=localsetting_ov1D(ax,bx,Nx,nx,ov)

hx=(bx-ax)/(Nx*nx);


Hx=(bx-ax)/Nx;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Setting mesh \n');
hbar=waitbar(0,':(');
hbarn=0;
intx=[ax,bx];

for i1=1:Nx
        hbarn=hbarn+1;
        waitbar(hbarn/(Nx),hbar);
        intx=[ax+(i1-1)*(bx-ax)/Nx-ov*hx*(i1>1),ax+(i1)*(bx-ax)/Nx+ov*hx*(i1<Nx)];
        [M,B,v,mesh,h,Ig]=createmeshAS1Dov(nx+ov+ov*(i1>1)*(i1<Nx),nx,intx,Nx,i1,ov);
        dom(i1).M=M;
        dom(i1).B=B;
        dom(i1).v=v;
        dom(i1).mesh=mesh;
        dom(i1).h=h;
        dom(i1).Ig=Ig;
    
end
close(hbar)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
nvel=(Nx*nx+1);
%b=sparse(nvel,1);
hbarn=0;
hbar=waitbar(0,':)');
for i1=1:Nx
        hbarn=hbarn+1;
        waitbar(hbarn/(Nx),hbar)
        M=dom(i1).M;
        v=dom(i1).v;
        mesh=dom(i1).mesh;
        [Asd,bsd]=Nmatrix1D(M,v,mesh);
        dom(i1).A=Asd;
        dom(i1).b=bsd;
        colI=dom(i1).Ig(2:mesh.nex);
%        b(colI)=b(colI)+bsd(2:mesh.nex);
end
close(hbar)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


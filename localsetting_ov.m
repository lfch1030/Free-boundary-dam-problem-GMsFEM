function [dom,b,nvel]=localsetting_ov(ax,bx,ay,by,Nx,Ny,nx,ny,ov,mu,k1perm)

hx=(bx-ax)/(Nx*nx);
hy=(by-ay)/(Ny*ny);

Hx=(bx-ax)/Nx;
Hy=(by-ay)/Ny;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Setting mesh \n');
hbar=waitbar(0,':(');
hbarn=0;
intx=[ax,bx];
inty=[ay,by];
for i1=1:Nx
    for i2=1:Ny
        hbarn=hbarn+1;
        waitbar(hbarn/(Nx*Ny),hbar);
        intx=[ax+(i1-1)*(bx-ax)/Nx-ov*hx*(i1>1),ax+(i1)*(bx-ax)/Nx+ov*hx*(i1<Nx)];
        inty=[ay+(i2-1)*(by-ay)/Ny-ov*hy*(i2>1),ay+(i2)*(by-ay)/Ny+ov*hy*(i2<Nx)];
        [M,B,v,mesh,h,Igfree,Ig,free]=createmeshAS(nx,ny,intx,inty,Nx,Ny,i1,i2,ov);
        dom(i1,i2).M=M;
        dom(i1,i2).B=B;
        dom(i1,i2).v=v;
        dom(i1,i2).mesh=mesh;
        dom(i1,i2).h=h;
        dom(i1,i2).Ig=Ig;
        dom(i1,i2).Igfree=Igfree;
        
        dom(i1,i2).free=free;
    end
end
close(hbar)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
nvel=(Nx*nx+1)*(Ny*ny+1);
b=sparse(nvel,1);
hbarn=0;
hbar=waitbar(0,':(');
for i1=1:Nx
    for i2=1:Ny
        hbarn=hbarn+1;
        waitbar(hbarn/(Nx*Ny),hbar);
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        mesh=dom(i1,i2).mesh;
        free=dom(i1,i2).free;
        
        [Asd,bsd]=Nmatrix(M,v,mesh,mu,k1perm);
        Massd=NMassmatrix(M,v,mesh,mu,k1perm);
 %       Massd=NMassmatrix(M,v,mesh);
        dom(i1,i2).Mass=Massd;

        dom(i1,i2).A=Asd;
    end
end
close(hbar)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


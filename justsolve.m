for i1=1:Nx-1
    for i2=1:Ny-1
        tx=0*x;

        ln=dom_ov(i1,i2).mesh.nv;
        lbase=sparse(ln,1);
        A=dom_ov(i1,i2).A;
        free=dom_ov(i1,i2).free;
        I=1:ln;
        Ig=dom_ov(i1,i2).Ig;
        d=setdiff(I,free);
        nex=dom_ov(i1,i2).mesh.nex;
        ney=dom_ov(i1,i2).mesh.ney;
        i1nd=nex/2+1;
        i2nd=ney/2+1;
        nd=(i2nd-1)*(nex+1)+i1nd;
%         nd2=(i2nd-1)*(nex+1)+i1nd+1;
%         nd3=(i2nd-1)*(nex+1)+i1nd-1;
%         nd4=(i2nd)*(nex+1)+i1nd
%         nd5=(i2nd-2)*(nex+1)+i1nd
        
        lbase(nd)=1;
        d=[d,nd];
        free=setdiff(free,d);
        tx(Ig)=lbase;
%        plot_vector(tx,dom_ov,Nx-1,Ny-1);
        philin=dom_ov(i1,i2).philin;
%        rhsaux=-A*philin(Ig);
        rhs=A(free,d)*lbase(d);
        lbase(free)=-A(free,free)\rhs;
        tx(Ig)=lbase;
        plot_vector(tx,dom_ov,Nx-1,Ny-1);
        pause
        hold off
    end
end

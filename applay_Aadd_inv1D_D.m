function applay_Aadd_inv1D_D(u,d,dom,dom_ov,dom_ov2,Nx,A0,psize,Niter,xpc)


frame=0;
fig1=figure;
winsize = get(fig1,'Position');
    winsize(1:2) = [0 0];
    fps=4;
   mov = avifile('MyTest1D2delta3VC.avi','fps',fps,'quality',10);
    set(fig1,'NextPlot','replacechildren');

w=sparse(size(u,1),size(u,2));
w=d;
plot_vector1Dsol(xpc,dom,Nx)
hold on
plot_vector1D(w,dom,Nx)
hold off

for l=1:2*psize

    myframe=getframe(gcf);
    mov=addframe(mov,myframe);

end



for iter=1:Niter
for i1=1:Nx
    A=dom_ov(i1).A;
    Ig=dom_ov(i1).Ig;
    
    Igfree=Ig(2:dom_ov(i1).mesh.nex);
    free=2:dom_ov(i1).mesh.nex;
    lu=u(Ig);
    ld=d(Ig)';
    AI=A(free,free);
    rhs=lu-A*ld';
    lAu=lu*0;
    lAu(free)=AI\rhs(free);
    w(Ig)=lAu+ld';
    plot_vector1Dsol(xpc,dom,Nx)
hold on

    plot_vector1D(w,dom,Nx)
    text(0.9,0.11,num2str(iter), 'FontSize', 20)
    axis([-0.05 1.05 -0.01 0.12])
    
    box off
    hold off
    d=w;
    for l=1:psize
    frame=frame+1;
    myframe=getframe(gcf);
    mov=addframe(mov,myframe);
  
    end
end
end

mov=close(mov);
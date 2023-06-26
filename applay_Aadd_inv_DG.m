function applay_Aadd_inv_DG(u,d,dom, dom_ov,Nx,Ny,mu,spause,Niter)


%mov=avifile('pd3.avi');

fig1=figure;
winsize = get(fig1,'Position');
    winsize(1:2) = [0 0];
    fps=4;
 %   outfile=sprintf('%s',outFileName)
    mov = avifile('MyTest1.avi','fps',fps,'quality',10);
    set(fig1,'NextPlot','replacechildren');

%axis tight
%set(gca,'nextplot','replacechildren');
% Record the movie
frame=0;
w=sparse(size(u,1),size(u,2))+d;
% Au=applay_A(u,dom,Nx,Ny);
% eu=dot(u,Au);

for l=1:3*spause
plot_vector(d, dom,Nx,Ny,mu,[]);
view((frame+45)/10,30)
% shading flat
axis([0 1 0 1 0 0.1])
% plot_mesh(dom,Nx,Ny)
    frame=frame+1;
    myframe=getframe(gcf);
    mov=addframe(mov,myframe);
end

for ni=1:Niter
for i1=1:Nx
    for i2=1:Ny    
        waux=sparse(size(u,1),size(u,2));

    AI=dom_ov(i1,i2).A;
    Igfree=dom_ov(i1,i2).Igfree;
    Ig=dom_ov(i1,i2).Ig;
    free=dom_ov(i1,i2).free;
    lu=u(Ig);
    ld=0*u(Ig);
    
    n=size(AI,1);
    boundary=setdiff(1:n,free);
    boundaryg=Ig(boundary);
    ld(boundary)=d(boundaryg);
waux(boundaryg)=d(boundaryg);
if ni==1  
for l=1:3*spause
plot_vector(waux, dom,Nx,Ny,mu,[]);
view((frame+45)/10,30)
% shading flat
axis([0 1 0 1 0 0.1])
% plot_mesh(dom,Nx,Ny)
    frame=frame+1;
    myframe=getframe(gcf);
    mov=addframe(mov,myframe);
end
end
    rhs=lu-AI*ld;
    lAu=ld*0;
    lAu(free)=AI(free,free)\rhs(free);
%     wi=w*0;
%     wi(Igfree)=lAu;
    w(Ig)=lAu+ld;

if ni==1 
for l=1:3*spause
plot_vector_I(w,dom_ov,i1,i2,mu,[])
axis([0 1 0 1 0 0.1])
    plot_mesh(dom,Nx,Ny)
axis([0 1 0 1 0 0.1])
view((frame+45)/10,30)
% shading flat
    frame=frame+1;
        myframe=getframe(gcf);
    mov=addframe(mov,myframe);
end

end


%     Awi=applay_A(wi,dom,Nx,Ny);
%     eui((i1-1)*Ny+i2)=dot(Awi,wi);
for l=1:spause
plot_vector(w, dom,Nx,Ny,mu,[]);
    text(0.9,0.9,0.09,num2str(ni),'FontSize',20);
axis([0 1 0 1 0 0.1])
%     shading flat

view((frame+45)/10,30)
    frame=frame+1;
    myframe=getframe(gcf);
    mov=addframe(mov,myframe);
end
hold off
    d=w;
    end
end
end
% max(eui./eu)
% pause
mov=close(mov);
function [SD,H] =decomposition(Nsx,Nsy,nex,ney,M,B,v,mesh,h,intx,inty)

Hx=(bx-ax)/Nsx;
Hy=(by-ay)/Nsy;
ov=1;
for Ix=1:Nsx
    for Iy=1:Nsy
        Vx=ax+(ix-1)*(bx-ax)/Nsx;
        Vy=ay+(iy-1)*(by-ay)/Nsy;
        xmin=Vx-(ov-1/3)*h.hx;
        xmax=Vx+(ov+1/3)*h.hx;
        ymin=Vy-(ov-1/3)*h.hy;
        ymax=Vy+(ov+1/3)*h.hy;
        v1=v(1,:);
        v2=v(2,:);
        I=1:size(v2,1);
        Index=(v1>xmin).*(v1<xmax).*(v2>ymin).*(v2<ymax);
        ID=I(Index);
        for i=1:size(ID) 
    end 
end


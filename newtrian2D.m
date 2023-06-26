

vaux=v;
for i=1:ne
   e=M(i,:);
   evxaux=vaux(e,1);   evyaux=vaux(e,2);
   
   evx=v(e,1);   evy=v(e,2);
   
   v1xaux=evxaux(2)-evxaux(1);   v1yaux=evyaux(2)-evyaux(1);
   v2xaux=evxaux(3)-evxaux(1);   v2yaux=evyaux(3)-evyaux(1);
   
   v1x=evx(2)-evx(1);   v1y=evy(2)-evy(1);
   v2x=evx(3)-evx(1);   v2y=evy(3)-evy(1);
   c1=v1xaux/v1x;

   evxaux(2)=evxaux(1)+c1*v1x;   evyaux(2)=evyaux(1)+c1*v1y;
   evxaux(3)=evxaux(1)+coef(i)/c1*v2x;   evyaux(3)=evyaux(1)+coef(i)/c1*v2y;
   vaux(e,1)=evxaux; vaux(e,2)=evyaux;
   vaux
   e
   trimesh([1,2,3],evxaux,evyaux)
   hold on
   pause
%   clear evxaux evyaux 


%    e=M(i+1,:);
%    evxaux=vaux(e,1);
%    evyaux=vaux(e,2);
%    evx=v(e,1);
%    evy=v(e,2);
%    v1xaux=evx(2)-evx(1);
%    v1yaux=evy(2)-evy(1);
%    v2xaux=evx(3)-evx(1);
%    v2yaux=evy(3)-evy(1);
%    v1x=evx(2)-evx(1);
%    v1y=evy(2)-evy(1);
%    v2x=evx(3)-evx(1);
%    v2y=evy(3)-evy(1);
%    c1=v2yaux/v2yaux;
%    evxaux(2)=evxaux(1)+coef(i+1)/c1*v1x;
%    evyaux(2)=evyaux(1)+coef(i+1)/c1*v1y;
%    evxaux(3)=evxaux(1)+c1*v2x;
%    evyaux(3)=evyaux(1)+c1*v2y;
%    vaux(e,1)=evxaux;
%    vaux(e,2)=evyaux;
%    trimesh([1,2,3],evxaux,evyaux,evxaux*0+1)
%    pause

end




function w=applay_AGG_local(u,dom,i1,i2)

Su=sparse(size(u,1),size(u,2));

    A=dom(i1,i2).A;
    Ig=dom(i1,i2).Ig;
    B=dom(i1,i2).B;
    bry=[B.vup;B.vleft;B.vdown;B.vright];
    It=1:size(Ig,2);
    G=unique(bry);
    I=setdiff(It,G);
    Gg=Ig(G);
    IIg=Ig(I);

    lu=u(Gg);
%     full(lu)
%     pause
    AII=A(I,I);
%     full(AII)
%     pause
    AIG=A(I,G);
%     full(AIG)
%     pause
    AGI=A(G,I);
%     full(AGI)
%     pause
    AGG=A(G,G);
%     full(AGG)
%     pause
 %   SuG=AGG*lu;
%  AIG
%  lu
%  pause
    lSu=AGG*lu;
% full(lSu)
% pause
    Su(Gg)=lSu;
w=Su;
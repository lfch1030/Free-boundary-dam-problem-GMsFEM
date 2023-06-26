
for exponent=[5,7]
    for n=[10,5]
        save control exponent n
        mu=10^(exponent-1)-1;
        %read_perm_juan
        newperm2_2
        k1perm=k';
        % perm_gen2
        % k1perm=k';
        max_it=5000;
        %tol=0.000000001;
        tol=1e-10;
        ax=0;bx=1;ay=0;by=1;
        Nx=100/n; Ny=Nx;
        nx=n;ny=nx;


        %maintwoB
        [dom,dom_ov,b,bnew,xd]=maintwoB(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol);

        [A0,d0,v0]=coarse_matrix(dom,dom_ov,Nx,Ny);
        [A0MS,d0MS,v0MS]=coarse_matrix_MS(dom,dom_ov,Nx,Ny);
        [A0EMF,d0EMF,v0EMF]=coarse_matrix_EMF(dom,dom_ov,Nx,Ny);
        %A0EMAM=coarse_matrix_EMAM(dom,dom_ov,Nx,Ny);
        [A02C,d02C,d02Cn,v02C,P1]=coarse_matrixBAD(dom,dom_ov,Nx,Ny);
        [A02CMS,d02CMS,d02CMSn,v02CMS,P1MS]=coarse_matrixBADMS(dom,dom_ov,Nx,Ny);
        [A02CMS2,d02CMS2,d02CMS2n,v02CMS2,P1MS2]=coarse_matrixBADMStwo(dom,dom_ov,Nx,Ny);
        [A02Cr,d02Cr,d02Crn,v02Cr,P1r]=coarse_matrixBADMSrB(dom,dom_ov,Nx,Ny);

        %[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, 2*max_it, tol,dom,Nx,Ny);
        %sol=3*dom_ov(2,2).philin+dom_ov(4,4).phiEM;
        %b=applay_A(sol,dom,Nx,Ny);


        %CV=CV+1;
        %[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, max_it, 2*tol,dom,Nx,Ny,mu);
%        [x1L, error1L, iter1L, flag1L, lambdamax1L, condnumber1L] = Apcg(b*0, bnew,bnew, max_it, tol,dom,dom_ov,Nx,Ny,mu);
%        x2L=x1L;
        [x2L, error2L, iter2L, flag2L, lambdamax2L, condnumber2L] = Apcg_ADD_2L(b*0, bnew,bnew, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0,d0);
        % [xMS, errorMS, iterMS, flagMS, lambdamaxMS, condnumberMS] = Apcg_ADD_2LMS(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0MS);
        % [xEM, errorEM, iterEM, flagEM, lambdamaxEM, condnumberEM] = Apcg_ADD_2LEMF(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMF);
        %[xAM, errorAM, iterAM, flagAM, lambdamaxAM, condnumberAM] = Apcg_ADD_2LEMAM(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMAM);
        % [x2C, error2C, iter2C, flag2C, lambdamax2C, condnumber2C] = Apcg_ADD_2LtwoC(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02C);
        % [x2CMS, error2CMS, iter2CMS, flag2CMS, lambdamax2CMS, condnumber2CMS] = Apcg_ADD_2LtwoCMS(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02CMS);
        % [x2CMS2, error2CMS2, iter2CMS2, flag2CMS2, lambdamax2CMS2, condnumber2CMS2] = Apcg_ADD_2LtwoCMS2(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02CMS2);
   
    %save solutions.mat xMS x2L xEM x2C

    %[iter,iter1L, iter2L, iterEMF]
    %iterlambdaEMF
    % % % Siter(exponent,:)=[mu, iter1L, iter2L,iterMS,  iterEM,iter2C,iter2CMS,iter2CMS2]
    % % % % Siter(n,N)=iter2L;
    % % %
    % % % Scond(exponent,:)=[condnumber1L,condnumber2L,condnumberMS,condnumberEM,condnumber2C, condnumber2CMS,condnumber2CMS2 ];
    % % % %Scond(n,N)=condnumber2L;
    % % % %Slmax(exponent,:)=[lambdamax1L,lambdamax2L, lambdamaxMS];
    % % % %dom=piecewisecoeff2D(dom,Nx,Ny,mu,[])
    % % % tb.iter=Siter;
    % % % % tb.lambmax=Slmax;
    % % %  tb.cond=Scond;
    % % %  tb.dom=dom;
    % % % % tb.iterlambdaEMF=iterlambdaEMF;
    % % %
    % % % tb.Nx=Nx,
    % % % tb.Ny=Ny;
    % % % % IN resultnew3.mat is the result with the new
    % % % % perm of exp1.
    % % %
    % % % save resultperm2.mat tb dom
    % % % %save resultnew5.mat tb dom
    % % % %save resultnew6.mat tb dom
    % % %
    % % % %save Inclusions.mat tb
    % % %
    % % %
    % % % badeig
    % % % lambdaL(n)=min(min(nexttobad));
    % % % Constant(n)=Nx^2/lambdaL(n);












    xf=x2L+xd;
    Axf= applay_AN(xf,dom,Nx,Ny);
    Mxf=applay_M(xf,dom,Nx,Ny);
    Exf=full(dot(xf,Axf));
    Hxf=norm_h1_global(xf,dom,Nx,Ny);
    L2xf=norm_l2_global(xf,dom,Nx,Ny);
    Mxf=full(dot(xf,Mxf));
L2vf=norm_velocityL2_global(xf,dom,Nx,Ny,mu,k1perm);
    %pEx=(x2L+xd).*Axf;
    %Ex=1;

    % % z02L=apply_P0Bd(b,dom_ov,Nx,Ny,A0,d0,v0);
    % % E2L=z02L-x2L-xd;
    % % AE2L= applay_AN(E2L,dom,Nx,Ny);
    % % ee2L=full(dot(E2L,AE2L))/Ex;



    z0MS=apply_P0MSBd(b,dom_ov,Nx,Ny,A0MS,d0MS,v0MS);
    EMS=z0MS-xf;
    AEMS= applay_AN(EMS,dom,Nx,Ny);
    MEMS= applay_M(EMS,dom,Nx,Ny);
    eeMS=full(dot(EMS,AEMS))/Exf;
    eMMS=full(dot(EMS,MEMS))/Mxf;
    ehMS=norm_h1_global(EMS,dom,Nx,Ny)/Hxf;
    el2MS=norm_l2_global(EMS,dom,Nx,Ny)/L2xf;
    eL2vMS=norm_velocityL2_global(EMS,dom,Nx,Ny,mu,k1perm)/L2vf;


    z0EM=apply_P0EMFBd(b,dom_ov,Nx,Ny,A0EMF,d0EMF,v0EMF);
    EEM=z0EM-xf;
    AEEM= applay_AN(EEM,dom,Nx,Ny);
    MEEM= applay_M(EEM,dom,Nx,Ny);
    eeEM=full(dot(EEM,AEEM))/Exf;
    eMEM=full(dot(EEM,MEEM))/Mxf;
    ehEM=norm_h1_global(EEM,dom,Nx,Ny)/Hxf;
    el2EM=norm_l2_global(EEM,dom,Nx,Ny)/L2xf;
    eL2vEM=norm_velocityL2_global(EEM,dom,Nx,Ny,mu,k1perm)/L2vf;


    z02C=apply_P0BADBd2(b,dom_ov,Nx,Ny,A02C,d02C,d02Cn,v02C,P1);
    E2C=z02C-xf;
    AE2C= applay_AN(E2C,dom,Nx,Ny);
    ME2C= applay_M(E2C,dom,Nx,Ny);
    ee2C=full(dot(E2C,AE2C))/Exf;
    eM2C=full(dot(E2C,ME2C))/Mxf;
    eh2C=norm_h1_global(E2C,dom,Nx,Ny)/Hxf;
    el22C=norm_l2_global(E2C,dom,Nx,Ny)/L2xf;
    eL2v2C=norm_velocityL2_global(E2C,dom,Nx,Ny,mu,k1perm)/L2vf;



    z02CMS2=apply_P0BADMS2Bd2(b,dom_ov,Nx,Ny,A02CMS2,d02CMS,d02CMSn,v02CMS,P1MS);
    E2CMS2=z02CMS2-xf;
    AE2CMS2= applay_AN(E2CMS2,dom,Nx,Ny);
    ME2CMS2= applay_M(E2CMS2,dom,Nx,Ny);
    ee2CMS2=full(dot(E2CMS2,AE2CMS2))/Exf;
    eM2CMS2=full(dot(E2CMS2,ME2CMS2))/Mxf;
    eh2CMS2=norm_h1_global(E2CMS2,dom,Nx,Ny)/Hxf;
    el22CMS2=norm_l2_global(E2CMS2,dom,Nx,Ny)/L2xf;
    eL2v2CMS2=norm_velocityL2_global(E2CMS2,dom,Nx,Ny,mu,k1perm)/L2vf;



    z0R=apply_P0BADMSrBd2(b,dom_ov,Nx,Ny,A02Cr,d02Cr,d02Crn,v02Cr,P1r);
    ER=z0R-xf;
    AER= applay_AN(ER,dom,Nx,Ny);
    MER= applay_M(ER,dom,Nx,Ny);
    eeR=full(dot(ER,AER))/Exf;
    eMR=full(dot(ER,MER))/Mxf;
    ehR=norm_h1_global(ER,dom,Nx,Ny)/Hxf;
    el2R=norm_l2_global(ER,dom,Nx,Ny)/L2xf;
    eL2vR=norm_velocityL2_global(ER,dom,Nx,Ny,mu,k1perm)/L2vf;






    EnergyE(exponent,n).S=[eeMS, eeEM, ee2C, ee2CMS2, eeR];
    L2weigES(exponent,n).S=[eMMS, eMEM, eM2C, eM2CMS2, eMR];
    H1E(exponent,n).S=[ehMS, ehEM, eh2C, eh2CMS2, ehR];
    L2E(exponent,n).S=[el2MS, el2EM, el22C, el22CMS2, el2R];
    L2V(exponent,n).S=[eL2vMS,eL2vEM,eL2v2C, eL2v2CMS2, eL2vR];


[mu+1, n/100,eeMS, eeEM, ee2C, ee2CMS2, eeR]


    save convPERM2.mat EnergyE L2weigES H1E L2E
clear x2L
end
end
%
% for n=1:4
%     for N=1:4
%         fprintf('%d (%.2f) &   ', Siter(n,N),Scond(n,N))
%
%     end
%             fprintf('\n  ', Iter(n,N),Cond(n,N))
%
% end
%
% %end
%

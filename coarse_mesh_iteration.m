for itime=1:500

    for fpit=1:min(itime,20)
        bnew=b-applay_AN(xdir,dom,Nx,Ny)-(0.5/deltat)*applay_M(xdir,dom,Nx,Ny)-0.5*apply_O1(xdir,dom,Nx,Ny,N0left,N0right)-0.5*apply_O2(xdir,dom,Nx,Ny,N0left,N0right);

        bnew=bnew-(1/deltat)*apply_O1(beta,dom,Nx,Ny,N0left,N0right)-apply_O2(alpha,dom,Nx,Ny,N0left,N0right)-(1/deltat)*applay_M(beta,dom,Nx,Ny)+(1/deltat)*applay_M1(w,dom,Nx,Ny);

        %                    [x2Lcg, error2L, iter2L, flag2L, lambdamax2L, condnumber2L] = Apcg_ADDdam(b*0, bnew,bnew, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0,d0,deltat,N0left,N0right);
        %                    [x2L, error2L, iter2L, flag2L] = gmresdam(b*0, bnew,bnew, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0,d0,deltat,N0left,N0right,500);
        x2L=bnew*0;
        x2L(free)=A(free,free)\bnew(free);

        xdir0=apply_R0BADB_T(x0d,dom_ov,Nx,Ny);


        bnew1=b-applay_AN(xdir0,dom,Nx,Ny)-(0.5/deltat)*applay_M(xdir0,dom,Nx,Ny)-0.5*apply_O1(xdir0,dom,Nx,Ny,N0left,N0right)-0.5*apply_O2(xdir0,dom,Nx,Ny,N0left,N0right);

        bnew1=bnew1-(1/deltat)*apply_O1(beta,dom,Nx,Ny,N0left,N0right)-apply_O2(alpha,dom,Nx,Ny,N0left,N0right)-(1/deltat)*applay_M(beta,dom,Nx,Ny)+(1/deltat)*applay_M1(w,dom,Nx,Ny);


        b0=R0'*bnew1;
        x2L0=x0d*0;
        free0=setdiff(1:length(A0),dir);
        x2L0(free0)=A0(free0,free0)\b0(free0);
        x2L0=x2L0+x0d;
        x2L0down=apply_R0BADB_T(x2L0,dom_ov,Nx,Ny);

        p=x2L0down;  %presion malla gruesa

        %p=x2L+xdir; %presion malla fina

        % itcout(itime,fpit)=iter2L;
        % plot_vector(betanew-alpha,dom,Nx,Ny,nx,ny);

        betaaux=p+beta;
        betanew= -betaaux.*(betaaux<0)+betaaux.*(betaaux>=0).*(betaaux<=1) +(2-betaaux).*(betaaux>1);
        nbeta=norm(betanew-beta);
        beta=betanew;

        alphaaux=p+alpha;
        alphanew=-abs(alphaaux);

        % figure(3)
        % plot_vector(alphanew-alpha,dom,Nx,Ny,nx,ny);
        % hold on

        %                     betaaux=p+beta;
        %                     betanew= -betaaux.*(betaaux<0)+betaaux.*(betaaux>=0).*(betaaux<=1) +(2-betaaux).*(betaaux>1);
        %                     nbeta=norm(betanew-beta);
        %                     beta=betanew;

        nalpha=norm(alphanew-alpha);
        fprintf( 'nalpha(%d)=%.7f,  \n',fpit,nalpha)
        alpha=alphanew;



    end

    %theta=beta -  beta.*(beta<0)+beta.*(beta>=0).*(beta<=1) +(2-.5*beta).*(beta>1);
    theta=beta+0.5*p;
    xdir=p;
    %              theta=0*(p<0)+1*(p>=0);
    %                 figure(1)
    %                 plot_vector(p,dom,Nx,Ny)
    %                 colormap jet
    %                 shading interp
    %                 view(2)
    %                 axis square
    %                 hold off
    %
    %                 figure(2)
    %                 plot_vector(theta,dom,Nx,Ny,mu,k1perm);
    %                 axis square
    %                 shading interp
    %                 view(2)
    %                 hold off
    %
    %                 title(itime)
    %                 hold off
    %                 pause(.1)
    %                 view(2)
    norinc=norm(pold-p);
    fprintf('time = %d, norm(pold-p)= %.10f \n',itime, norinc);
    if( norinc<0.0001)
        break
    end
    pold=p;
    p_coarse=p;
    theta_coarse=theta;
    
end




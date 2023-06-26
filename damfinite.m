
for n=[0]
    for N=1
        exponent=n;
        mu=10^((exponent-1));
        new_perm_o % newperm2
        k1perm=k; % newperm2 k1perm=k'
        max_it=2000;tol=1e-6;
        ax=0;bx=1;ay=0;by=1;
        Nx=10; Ny=Nx;
        nx=5; ny=nx;
        
        % for add=[0,1,2,3,4,5]
        for add=[4]
            %maintwoB
            [dom,dom_ov,b,bnew,xd]=maintwoB(ax,bx,ay,by,Nx,Ny,nx,ny,mu,k1perm,max_it,tol,add);
            
            [A0,d0,v0]=coarse_matrix(dom,dom_ov,Nx,Ny);
            [A0MS,d0MS,v0MS]=coarse_matrix_MS(dom,dom_ov,Nx,Ny);
            %            [A0EMF,d0EMF,v0EMF]=coarse_matrix_EMF(dom,dom_ov,Nx,Ny);
            [A02C,d02C,d02Cn,v02C,P1]=coarse_matrixBAD(dom,dom_ov,Nx,Ny);
            
            
            xdir=b*0;
            pold=b*0;
            % for i=1:Nx
            %     for j=Ny
            %         xdir( dom(i,j).Ig(dom(i,j).B.vup)  )=1;
            %     end
            % end
            
            
            for i=1
                for j=1:3
                    xdir( dom(i,j).Ig(dom(i,j).B.vleft)  )= 4/5-dom(i,j).v(dom(i,j).B.vleft,2);
                end
            end
            
            
            for i=Nx
                for j=1:2
                    xdir( dom(i,j).Ig(dom(i,j).B.vright)  )=1/5-dom(i,j).v(dom(i,j).B.vright,2);
                end
            end
            
            
            deltat=0.01;
            
            % bnew=b-applay_AN(xdir,dom,Nx,Ny);
            [wx, wy]=xandy(b,dom,Nx,Ny);
            
            
            beta=b*0+max(0*wy,(4/5 -wx*(3/5))-wy); N0left=9; N0right=3;
            alpha=-beta;
            theta=0+(((4/5 -wx*(3/5))-wy)>0);
            
            kappa=coeficient(wx,wy,mu,k1perm)';
            gravity=1;
            nv=(Nx*nx+1)*(Ny*ny+1);
            w=argtranslationup(theta.*kappa,nv,nx*Nx,ny*Ny,gravity, deltat);
            xdir=beta;
            %%
            %%
            finematrix
            matrixR
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
                    pf=x2L0down;  %presion malla gruesa
                    pg=x2L+xdir; %presion malla fina
                    % itcout(itime,fpit)=iter2L;
                    betaaux=pf+beta;
                    betanew= -betaaux.*(betaaux<0)+betaaux.*(betaaux>=0).*(betaaux<=1) +(2-betaaux).*(betaaux>1);
                    nbeta=norm(betanew-beta);
                    beta=betanew;
                    
                    alphaaux=pf+alpha;
                    alphanew=-abs(alphaaux);
                    
                    nalpha=norm(alphanew-alpha);
                    fprintf( 'nalpha(%d)=%.7f,  \n',fpit,nalpha)
                    alpha=alphanew;
                    
                    betaaux=pg+beta;
                    betanew= -betaaux.*(betaaux<0)+betaaux.*(betaaux>=0).*(betaaux<=1) +(2-betaaux).*(betaaux>1);
                    nbeta=norm(betanew-beta);
                    beta=betanew;
                    
                    alphaaux=pg+alpha;
                    alphanew=-abs(alphaaux);
                    
                    nalpha=norm(alphanew-alpha);
                    fprintf( 'nalpha(%d)=%.7f,  \n',fpit,nalpha)
                    alpha=alphanew;
                    
                    
                end
                
                 thetag=beta+0.5*pg;
                xdir=pg;
                
               norinc=norm(pold-pg);
                fprintf('time = %d, norm(pold-p)= %.10f \n',itime, norinc);
                if( norinc<0.0001)
                   break
                end
                pold=pg;
                
                
            end
           
        end
    end
end

%Calculo del error
error=pf-pg
errorA=sqrt(abs(error'*A*error))/sqrt(abs(pf'*A*pf))




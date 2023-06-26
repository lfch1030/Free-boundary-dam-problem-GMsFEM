
for n=[3]  %Contras
    for N=1
        exponent=n;
        mu=10^((exponent-1));
        TypeM1=6;
        %mesh_sol='coarse';
        mesh_sol='fine';
        switch TypeM1
            case 1
                Medium='Juan1';
                new_medium_frac;
                
                k1perm=k*0+1;
                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) (5*pi^2-1)*u;
                u0=@(x,y) sin(2*pi*x).*sin(pi*y);      %Inicial_condition
            case 2
                Medium='Juan_Dam';
                new_perm_o;
                %newperm3; % newperm2
                k1perm=fliplr(k); % newperm2 k1perm=k'
                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) -u.*(1-u).*(1+u);    %Source
                u0=@(x,y) x.*(1-x).*y.*(1-y); %Inicial condition
            case 3
                Medium='J_Dam';
                newperm2 % newperm2
                k1perm=k; % newperm2 k1perm=k'
                Contrast=max(max(k1perm))/min(min(k1perm));
            case 4
                Medium='Exact';
                load('Juan1','A');
                J1=A;
                J1(:,end) = []; %Quita ultima columna
                k1perm=J1*0+1; % newperm2 k1perm=k'
                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) (5*pi^2-1)*u;                %Source
                u0=@(x,y) sin(2*pi*x).*sin(pi*y);      %Inicial_condition
            case 5
                Medium='Fractal';
                new_medium_frac;
                k1perm=k;
                %newperm3; % newperm2
                %k1perm=fliplr(k); % newperm2 k1perm=k'
                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) -u.*(1-u).*(1+u);    %Source
                u0=@(x,y) x.*(1-x).*y.*(1-y); %Inicial condition
             case 6
                Medium='Kxx_48';
                A= importdata('Kxx_48.dat');
                J1=A;
                J1=(mu-1).*((J1-min(min(J1)))/(max(max(J1))-min(min(J1))))+1;
                J2=J1;
                J2(:,101:end) = []; %Quita ultima columna
                J3=J1(:,101:200);
                %J1=J1';
                
                k1perm=[J2;J3]; % newperm2 k1perm=k'
                k1perm(101:end,:)=[];
                k1perm=k1perm';
                k1perm(1:10,:)=1;
                k1perm(91:100,:)=1;
                k1perm(:,1:10)=1;
                k1perm(:,91:100)=1;

                Contrast=max(max(k1perm))/min(min(k1perm));
                Fun1=@(u) (5*pi^2-1)*u;
                u0=@(x,y) sin(2*pi*x).*sin(pi*y);      %Inicial_condition

        end
        max_it=2000;tol=1e-6;
        ax=0;bx=1;ay=0;by=1;
        Nx=10; Ny=Nx;
        nx=10; ny=nx;
        Matrix_error=[];
        Contrast=mu;
        % for add=[0,1,2,3,4,5]
        for add=[0:5]
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
            
            
            deltat=0.001;
            
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


            coarse_mesh_iteration;
            p=0*p;
            theta=theta*0
            fine_mesh_iteration;
            Error_p_theta
            p=0*p;
            theta=theta*0

            
        end
        
        
        GraphicSolutions;
                
        GraphicError
       % exportgraphics(fine_f,['figure\fine_Sol_',type_problem,'_Med=',Medium,'-Cont=',num2str(Contrast),',_T=',num2str(T),'.pdf'],'ContentType','vector');
        plot_coefficient_coarseM_v2
    end
end

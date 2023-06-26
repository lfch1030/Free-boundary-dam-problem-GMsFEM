maxT=max([max(p_fine),max(p_coarse)]);
minT=min([min(p_fine),min(p_coarse)]);    

maxTt=min([1,max([max(theta_fine),max(theta_coarse)])]);
minTt=max([0,min([min(theta_fine),min(theta_coarse),0])]  );

f1=figure;
        plot_vector(theta_fine,dom,Nx,Ny,mu,k1perm);
        axis square
        %shading interp
        colorbar('Ticks',minTt:(maxTt-minTt)/5:maxTt);
        clim([minTt maxTt]);
        f1.Position=[0 0 300 250];
        xticks(0:.25:1);
        yticks(0:.25:1);
        view(2)
        hold off
        
        f2=figure;
        plot_vector(p_fine,dom,Nx,Ny)
        colormap jet
        %shading interp
        colorbar('Ticks',minT:(maxT-minT)/5:maxT);
        clim([minT maxT]);
        xticks(0:.25:1);
        yticks(0:.25:1);
        f2.Position=[0 0 300 250];
        view(2)
        axis square
        hold off

        f3=figure;
        plot_vector(theta_coarse,dom,Nx,Ny,mu,k1perm);
        axis square
        colorbar('Ticks',minTt:(maxTt-minTt)/5:maxTt);
        clim([minTt maxTt]);
        %shading interp
        f3.Position=[0 0 300 250];
        xticks(0:.25:1);
        yticks(0:.25:1);
        view(2)
        hold off
        
        f4=figure;
        plot_vector(p_coarse,dom,Nx,Ny)
        colormap jet
        %shading interp
        colorbar('Ticks',minT:(maxT-minT)/5:maxT);
        clim([minT maxT]);
        xticks(0:.25:1);
        yticks(0:.25:1);
        f4.Position=[0 0 300 250];
        view(2)
        axis square
        hold off
        
        
        writematrix(Matrix_error,['figure\Matrix_error=',Medium,'_contrast=',num2str(Contrast),'_Nv=',num2str(add+1),'.txt']);
        exportgraphics(f1,['figure\sat_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_mesh=Fine.pdf'],'ContentType','vector');
        exportgraphics(f2,['figure\pre_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_mesh=Fine.pdf'],'ContentType','vector');
        exportgraphics(f3,['figure\sat_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_mesh=Coarse.pdf'],'ContentType','vector');
        exportgraphics(f4,['figure\pre_Med=',Medium,'-Cont=',num2str(Contrast),'_Nv=',num2str(add+1),',_mesh=Coarse.pdf'],'ContentType','vector');
        
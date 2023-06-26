
for n=[7]
    fprintf('Contrast=10^%d \n',n-1);
    e_aux=tb(n,0+1).EnergyE;
    el2w_aux=tb(n,0+1).L2weigE;
    eh1_aux=tb(n,0+1).H1E;
    el2_aux=tb(n,0+1).L2E;
    
    fprintf('\t\t  MS Energy = %.15f \n',e_aux(1) );
    fprintf('\t\t  MS H1 = %.15f \n',eh1_aux(1) );
    fprintf('\t\t  MS L2weighted = %.15f \n',el2w_aux(1) );
    fprintf('\t\t  MS L2 = %.15f \n',el2_aux(1) );
    fprintf('\t\t  MS Dimension = %d \n\n', 16);
    
%    fprintf('\t LL= %d \n',tb(iLL).LL);
    
    for add=[0,1,2,3,4]
         e_aux=tb(n,add+1).EnergyE;
    el2w_aux=tb(n,add+1).L2weigE;
    eh1_aux=tb(n,add+1).H1E;
    el2_aux=tb(n,add+1).L2E;
        fprintf('\t\t +%d LSM Energy = %.15f \n',add,e_aux(2) );
        fprintf('\t\t +%d LSM H1 = %.15f \n',add,eh1_aux(2) );
        fprintf('\t\t +%d LSM L2weighted = %.15f \n',add,el2w_aux(2) );
        fprintf('\t\t +%d LSM L2  = %.15f \n',add,el2_aux(2) );
        fprintf('\t\t +%d LSM Dimension  = %d \n\n',add,tb(n,add+1).dim2C );
        
        
        fprintf('\t\t *** +%d LSMtilde Energy = %.15f \n',add,e_aux(3) );
        fprintf('\t\t *** +%d LSMtilde H1 = %.15f \n',add,eh1_aux(3) );
        fprintf('\t\t *** +%d LSMtilde L2weighted = %.15f \n',add,el2w_aux(3) );
        fprintf('\t\t *** +%d LSMtilde L2 = %.15f \n',add,el2_aux(3) );
        fprintf('\t\t *** +%d LSMtilde Dimension  = %d \n\n',add,tb(n,add+1).dim2Ctilde );
        
        
        
        
        
        
        
        
        
        
    end
end


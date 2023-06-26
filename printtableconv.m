

for exponent=[5,7]
    for n=[10,5]
fprintf('\n exponent=%d ',exponent)        
Nx=100/n; Ny=Nx;
nx=n;ny=nx;
h=1/(nx*Nx);
H=1/Nx;
fprintf('h=%f, H=%f \n',h,H)
%EnergyE(exponent,n).S
% fprintf('  %.4f ',EnergyE(exponent,n).S)
%fprintf('  %.4f ',H1E(exponent,n).S)
% fprintf('  %.5f ',L2weigES(exponent,n).S)
%fprintf('  %.5f ',L2E(exponent,n).S)
fprintf('  %.5f ',L2V(exponent,n).S)

%L2weigES(exponent,n).S
%H1E(exponent,n).S
%L2E(exponent,n).S
pause
    end
   
end

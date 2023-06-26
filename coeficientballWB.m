function a=coeficientballWB(x1,x2, mu)


rand('state',128)


a=0*x1;
B=4;

y=rand(B,B);
for i1=1:B
    for i2=1:B
        I1=(x1>=((i1-1)/B)).*(x1<i1/B);
        I2=(x2>=((i2-1)/B)).*(x2<i2/B);
%        if mod(i2-1,2)==0
%        aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,1);
%        else
        aI=block2(B*x1-floor(B*x1),B*x2-floor(B*x2),mu*(1+5*y(i1,i2)),1);
%        end 
        aI=aI .*I1.*I2;

        a=a+aI;
    end
end
 a=(a)+1;


% %a=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,);

function ab=block(x1,x2,mu,bn)
if  bn==1  
        ab=(mu*(( abs(x2-0.65))<.2));
end



function ab=block2(x1,x2,mu,bn)
if bn==1 
     ab=(mu*(( ( ( (x2-0.5).^2+ (x1-0.5).^2) <0.2) )));
end


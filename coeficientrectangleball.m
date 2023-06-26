function a=coeficientrectangleball(x1,x2, mu)


a=0*x1;
B=5;
for i1=1:B
    for i2=1:B
        I1=(x1>=((i1-1)/B)).*(x1<i1/B);
        I2=(x2>=((i2-1)/B)).*(x2<i2/B);
        if i2==2 || i2==3 || i2==4 || i2==5
        aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,mod(i1+i2+1,2)+1);
 %       aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,mod(i1,2)+1);
        else
        aI=0*block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,mod(i1+1,2)+1);
        end 
        aI=aI .*I1.*I2;

        a=a+aI;
    end
end
 a=(a)+1;

function ab=block(x1,x2,mu,bn)
if  bn==1 

   %     ab=(mu*(  (( (abs(x1-0.3))>.05)).*(( (abs(x1-0.7))>.05)).*( (abs(x1-0.5))>.05)  ).*   (( abs(x2-0.5))<.05)  );
            ab=(mu*(  ( abs(x2-0.5))<.2) );
end


if  bn==2
%        ab=(mu*( (( abs(x1-0.5))>.2) ).*   (( abs(x2-0.5))<.2)  );
%     ab=(mu*(( (abs(x1-0.5)>0.2).*(abs(x2-0.5))<.2)));
%     ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.05) )));
     ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.05) )));
end


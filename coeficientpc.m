function a=coeficientpc(x1,x2, mu)




a=0*x1;
B=8;
for i1=1:B
    for i2=1:B
        I1=(x1>=((i1-1)/B)).*(x1<i1/B);
        I2=(x2>=((i2-1)/B)).*(x2<i2/B);
        aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,mod(i1+i2,3)+1);
        aI=aI .*I1.*I2;

        a=a+aI;
    end
end
 a=(a)+1;


% %a=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,);

function ab=block(x1,x2,mu,bn)
if  bn==1  
        ab=(mu*(x2*0+1));
end
if  bn==2 
        ab=(x2*0);
end
if  bn==3  
        ab=(10*mu*(x2*0+1))+9;
end



function ab=block2(x1,x2,mu,bn)
if bn==1 
     ab=(mu*(( (max(abs(x2-0.65),abs(x1-0.55)) <0.2) )));
end


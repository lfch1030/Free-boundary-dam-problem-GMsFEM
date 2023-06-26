function a=coeficientchannelball(x1,x2, mu)




a=0*x1;
B=2;
for i1=1:B
    for i2=1:B
        I1=(x1>=((i1-1)/B)).*(x1<i1/B);
        I2=(x2>=((i2-1)/B)).*(x2<i2/B);
        aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,1);
        aI=aI .*I1.*I2;

        a=a+aI;
    end
end


% for i1=[1,7];
%     for i2=3:2:B-1
%         I1=(x1>=((i1-1)/B)).*(x1<i1/B);
%         I2=(x2>=((i2-1)/B)).*(x2<i2/B);
%         if mod(i2-1,2)==0
%         aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,1);
%         else
%         aI=block2(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,1);
%         end 
%         aI=aI .*I1.*I2;
% 
%         a=a+aI;
%     end
% end


% for i1=4;
%     for i2=[3,5]
%         I1=(x1>=((i1-1)/B)).*(x1<i1/B);
%         I2=(x2>=((i2-1)/B)).*(x2<i2/B);
%         if mod(i2-1,2)==0
%         aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,1);
%         else
%         aI=block2(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,1);
%         end 
%         aI=aI .*I1.*I2;
% 
%         a=a+aI;
%     end
% end



a=(a)+1;

 
 

% %a=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,);

function ab=block(x1,x2,mu,bn)
if  bn==1  
        ab=(mu*(( abs(x2-0.5))<.15));
end



function ab=block2(x1,x2,mu,bn)
if bn==1 
     ab=(mu*(( ( ( (x2-0.5).^2+ (x1-0.5).^2) <0.15) )));
end


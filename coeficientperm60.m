function a=coeficientperm60(x1,x2,k1)

xx1=ceil(x1*60);
xx2=ceil(x2*60);
xx1=(xx1==0)+xx1;
xx2=(xx2==0)+xx2;
  a=k1(xx1,xx2 );
 a=diag(a)';

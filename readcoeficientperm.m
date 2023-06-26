function a=readcoeficientperm(x1,x2,k1)

xx1=ceil(x1*80);
xx2=ceil(x2*80);
xx1=(xx1==0)+xx1;
xx2=(xx2==0)+xx2;
  a=k1(xx1,xx2 );
 a=diag(exp(a))';

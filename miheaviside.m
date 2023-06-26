function y=miheaviside(p)

N=length(p);

y=0*p;
for i=1:N
    if(p(i)>0)
        y(i)=1;
    end
end

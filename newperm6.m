M=mu+1;  %contrast

k=ones(100,100);

for i=1:2:10
       k(4+(i-1)*10:6+(i-1)*10,:)=M;
end

for j=4:4:10 
k(:,(j-1)*10+1:j*10)=1;
end


for i=2:2:10
    for j=1:10
     k(4+(i-1)*10:6+(i-1)*10,4+(j-1)*10:6+(j-1)*10)=M;
    end
end


for i=1:2:10
    for j=1:7
     k(4+(i-1)*10:6+(i-1)*10,4+(j-1)*10:6+(j-1)*10)=M;
    end
end



for i=2:2:10
  k((i-1)*10+4:(i-1)*10+6,21:50)=M;
end


for i=2:2:10
  k((i-1)*10+4:(i-1)*10+6,71:80)=M;
end 
i=0;
for L=0.01:0.01:1
t=linspace(0,1,100);
[x,y]=meshgrid(t);

z=exp(-abs(x-y).^2/(L^2));
i=i+1;
%C(i)=cond(z);

%[Q,D]=eigs(z,eye(size(z)),40);
[Q,D]=eig(z);
[d,I]=sort(diag(D),'descend');
Q=Q(:,I);
J=[ 1 2 3 4]+10;

subplot(2,2,1)
plot(t,Q(:,J(1))); title(J(1))
%axis([0,1,0,1])
subplot(2,2,2)
plot(t,Q(:,J(2))); title(J(2))
subplot(2,2,3)
plot(t,Q(:,J(3))); title(J(3))
subplot(2,2,4)
plot(t,Q(:,J(4))); title(J(4))
pause(0.01)
end


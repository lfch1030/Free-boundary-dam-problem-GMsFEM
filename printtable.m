

for row=1:10
    fprintf(' $10^%d$  ',row-1)
%[mu(1),1L(2),2L(3),MS(4),EM(5),2C(6), 2CMS(7),2CMS2(8),R(9) ];

    for col=2:5
    fprintf('  &%d(%.2f) ',Siter(row,col), Scond(row,col-1))
end

    fprintf(' \\\\ \n ')
end

function A0=coarse_matrix1D(dom_ov2,dom,N)

A0=sparse(N-1,N-1);

for i=1:N-1
    phii=dom_ov2(i).phi;
    Aphii=applay_A1D(phii,dom,N);
    for j=1:N-1
        phij=dom_ov2(j).phi;
        A0(i,j)=dot(Aphii,phij);
    end
end
